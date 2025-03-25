`timescale 1ns / 1ps

module tb_nmed_mred;
    reg [7:0] A, B;
    wire [15:0] P_exact, P_approx;
    integer i, j;
    integer total_error = 0;
    real sum_RED = 0;
    integer max_exact = 0;
    real NMED, MRED, MED;
    integer num_tests = 65536; // 8x8 모든 경우의 수 (256x256)
    integer sum_ED = 0;
    integer ED = 0;
    real RED = 0;

    // ? 정확한 곱셈기 (Exact Multiplier)
    exact_multiplier exact_mult (
        .A(A),
        .B(B),
        .P(P_exact)
    );

    // ? 근사 곱셈기 (Approximate Multiplier)
    approx_multiplier_8x8 approx_mult (
        .A(A),
        .B(B),
        .P(P_approx)
    );

    initial begin
        $display("A\t B\t Exact\t Approx\t Abs Error\t Rel Error");

        // ? 모든 8×8 입력 조합 테스트 (총 256×256 = 65536개)
        for (i = 0; i < 256; i = i + 1) begin
            for (j = 0; j < 256; j = j + 1) begin
                A = i;
                B = j;
                #1;  // 연산 대기
                
                // ? 절대 오차(ED) 계산 |P_exact - P_approx|
                ED = (P_exact > P_approx) ? (P_exact - P_approx) : (P_approx - P_exact);
                sum_ED = sum_ED + ED;
                
                // ? 최대 P_exact 갱신 (max(P_exact))
                if (P_exact > max_exact) 
                    max_exact = P_exact;
                
                // ? 상대 오차(RED) 계산: ED / max(P_exact, 1) (정밀한 실수 연산)
                RED = ED * 1.0 / (P_exact > 0 ? P_exact : 1);
                sum_RED = sum_RED + RED;
            end
        end
        
        // ? MED 공식 적용
        MED = sum_ED * 1.0 / num_tests;  // sum_ED / 65536

        // ? NMED 공식 적용
        NMED = (MED / 65025) * 100;  // (255^2) = 65025, 백분율 변환

        // ? MRED 공식 적용
        MRED = (sum_RED / num_tests) * 100;

        // ? 결과 출력
        $display("\nNMED: %f%%", NMED);
        $display("MRED: %f%%", MRED);
        $display("MED: %f", MED);
        
        $finish;
    end

endmodule
