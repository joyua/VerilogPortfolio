`timescale 1ns / 1ps

module tb_vectormatch;

    reg [7:0] A, B;
    wire [15:0] Z;

    // 내부 관찰용 와이어
    wire [63:0] PP;
    wire [8:0] S1, E1, S2, E2, S3, E3, S4, E4;
    wire [10:0] S5, E5, S6, E6;
    wire [14:0] S7, E7;
    wire [3:0] E_internal;

    // DUT 인스턴스
    AMER_4b dut (
        .A(A), .B(B), .Z(Z)
    );

    // 내부 연결을 위해 하위 모듈도 인스턴스화
    stage1 s1 (.A(PP[7:0]), .B(PP[15:8]), .S(S1), .E(E1));
    stage1 s2 (.A(PP[23:16]), .B(PP[31:24]), .S(S2), .E(E2));
    stage1 s3 (.A(PP[39:32]), .B(PP[47:40]), .S(S3), .E(E3));
    stage1 s4 (.A(PP[55:48]), .B(PP[63:56]), .S(S4), .E(E4));
    
    stage2 s5 (.A(S1), .B(S2), .S(S5), .E(E5));
    stage2 s6 (.A(S3), .B(S4), .S(S6), .E(E6));
    stage3 s7 (.A(S5), .B(S6), .S(S7), .E(E7));

    ErrorRecovery er (
        .E3(E3), .E4(E4), .E6(E6), .E7(E7), .E(E_internal)
    );

    // Partial Product 생성
    genvar i, j;
    generate
        for (i = 0; i < 8; i = i + 1) begin : row
            for (j = 0; j < 8; j = j + 1) begin : col
                assign PP[i * 8 + j] = A[j] & B[i];
            end
        end
    endgenerate

    initial begin
        A = 8'd15;  // 예: 00001111
        B = 8'd27;  // 예: 00011011
        #5;

        $display("A  = %b", A);
        $display("B  = %b", B);
        $display("PP = %b", PP);

        $display("S1 = %b", S1);
        $display("E1 = %b", E1);
        $display("S2 = %b", S2);
        $display("E2 = %b", E2);
        $display("S3 = %b", S3);
        $display("E3 = %b", E3);
        $display("S4 = %b", S4);
        $display("E4 = %b", E4);
        $display("S5 = %b", S5);
        $display("E5 = %b", E5);
        $display("S6 = %b", S6);
        $display("E6 = %b", E6);
        $display("S7 = %b", S7);
        $display("E7 = %b", E7);
        $display("E  = %b", E_internal);
        $display("Z  = %b", Z);
        $display("Z (decimal) = %d", Z);
        
        $finish;
    end

endmodule
