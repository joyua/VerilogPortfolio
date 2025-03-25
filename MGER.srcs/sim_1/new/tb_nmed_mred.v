`timescale 1ns / 1ps

module tb_nmed_mred;
    reg [7:0] A, B;
    wire [15:0] P_exact, P_approx;
    integer i, j;
    integer total_error = 0;
    real sum_RED = 0;
    integer max_exact = 0;
    real NMED, MRED, MED;
    integer num_tests = 65536; // 8x8 ��� ����� �� (256x256)
    integer sum_ED = 0;
    integer ED = 0;
    real RED = 0;

    // ? ��Ȯ�� ������ (Exact Multiplier)
    exact_multiplier exact_mult (
        .A(A),
        .B(B),
        .P(P_exact)
    );

    // ? �ٻ� ������ (Approximate Multiplier)
    approx_multiplier_8x8 approx_mult (
        .A(A),
        .B(B),
        .P(P_approx)
    );

    initial begin
        $display("A\t B\t Exact\t Approx\t Abs Error\t Rel Error");

        // ? ��� 8��8 �Է� ���� �׽�Ʈ (�� 256��256 = 65536��)
        for (i = 0; i < 256; i = i + 1) begin
            for (j = 0; j < 256; j = j + 1) begin
                A = i;
                B = j;
                #1;  // ���� ���
                
                // ? ���� ����(ED) ��� |P_exact - P_approx|
                ED = (P_exact > P_approx) ? (P_exact - P_approx) : (P_approx - P_exact);
                sum_ED = sum_ED + ED;
                
                // ? �ִ� P_exact ���� (max(P_exact))
                if (P_exact > max_exact) 
                    max_exact = P_exact;
                
                // ? ��� ����(RED) ���: ED / max(P_exact, 1) (������ �Ǽ� ����)
                RED = ED * 1.0 / (P_exact > 0 ? P_exact : 1);
                sum_RED = sum_RED + RED;
            end
        end
        
        // ? MED ���� ����
        MED = sum_ED * 1.0 / num_tests;  // sum_ED / 65536

        // ? NMED ���� ����
        NMED = (MED / 65025) * 100;  // (255^2) = 65025, ����� ��ȯ

        // ? MRED ���� ����
        MRED = (sum_RED / num_tests) * 100;

        // ? ��� ���
        $display("\nNMED: %f%%", NMED);
        $display("MRED: %f%%", MRED);
        $display("MED: %f", MED);
        
        $finish;
    end

endmodule
