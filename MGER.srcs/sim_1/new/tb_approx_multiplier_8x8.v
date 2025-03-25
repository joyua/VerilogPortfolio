`timescale 1ns / 1ps


`timescale 1ns / 1ps

module tb_approx_multiplier_8x8;

    reg [7:0] A, B;
    wire [15:0] P_apx, P_ext;

    // Test ����� approx_multiplier_8x8 ��� �ν��Ͻ�ȭ
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
        $dumpfile("test.vcd");  // GTKWave�� ���� ���� ���� ����
        $dumpvars(0, tb_approx_multiplier_8x8);

        // �پ��� �Է� �׽�Ʈ
        A = 8'b00011001; B = 8'b00100110; #10; // 25 * 38
        $display("A = %d, B = %d, P(Approx) = %d, P(exact) = %d", A, B, P_apx, P_ext);
        
        A = 8'b11111111; B = 8'b11111111; #10; // 255 * 255
        $display("A = %d, B = %d, P (Approx) = %d, P(exact) = %d", A, B, P_apx, P_ext);
        
        A = 8'b00010100; B = 8'b11111111; #10; // 0 * 255
        $display("A = %d, B = %d, P (Approx) = %d, P(exact) = %d", A, B, P_apx, P_ext);
        
        A = 8'b10101010; B = 8'b01010101; #10; // ���� �׽�Ʈ
        $display("A = %d, B = %d, P (Approx) = %d, P(exact) = %d", A, B, P_apx, P_ext);

        A = 8'b10000001; B = 8'b00000011; #10; // ���� �� ����
        $display("A = %d, B = %d, P (Approx) = %d, P(exact) = %d", A, B, P_apx, P_ext);

        $finish;
    end
endmodule