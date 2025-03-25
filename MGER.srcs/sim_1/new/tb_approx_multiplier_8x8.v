`timescale 1ns / 1ps


`timescale 1ns / 1ps

module tb_approx_multiplier_8x8;

    reg [7:0] A, B;
    wire [15:0] P_apx, P_ext;

    // Test 대상인 approx_multiplier_8x8 모듈 인스턴스화
    approx_multiplier_8x8 uut1 (
        .A(A),
        .B(B),
        .P(P_apx)
    );
    
    exact_multiplier uut2 (
        .A(A),
        .B(B),
        .P(P_ext)
    );

    initial begin
        $dumpfile("test.vcd");  // GTKWave를 위한 덤프 파일 생성
        $dumpvars(0, tb_approx_multiplier_8x8);

        // 다양한 입력 테스트
        A = 8'b00011001; B = 8'b00100110; #10; // 25 * 38
        $display("A = %d, B = %d, P(Approx) = %d, P(exact) = %d", A, B, P_apx, P_ext);
        
        A = 8'b11111111; B = 8'b11111111; #10; // 255 * 255
        $display("A = %d, B = %d, P (Approx) = %d, P(exact) = %d", A, B, P_apx, P_ext);
        
        A = 8'b00010100; B = 8'b11111111; #10; // 0 * 255
        $display("A = %d, B = %d, P (Approx) = %d, P(exact) = %d", A, B, P_apx, P_ext);
        
        A = 8'b10101010; B = 8'b01010101; #10; // 패턴 테스트
        $display("A = %d, B = %d, P (Approx) = %d, P(exact) = %d", A, B, P_apx, P_ext);

        A = 8'b10000001; B = 8'b00000011; #10; // 작은 수 곱셈
        $display("A = %d, B = %d, P (Approx) = %d, P(exact) = %d", A, B, P_apx, P_ext);

        $finish;
    end
endmodule