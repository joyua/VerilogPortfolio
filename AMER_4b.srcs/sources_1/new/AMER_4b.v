`timescale 1ns / 1ps
module AMER_4b(
    input [7:0] A, B,
    output [15:0] Z
    );
    wire [63:0] PP;
    wire [8:0] S1, E1, S2, E2, S3, E3, S4, E4;
    wire [10:0] S5, E5, S6, E6;
    wire [14:0] S7, E7;
    wire [3:0] E;
    
    // Partial Product (PP) 1차원 배열 생성 (64개)
    genvar i, j;
    generate
        for (i = 0; i < 8; i = i + 1) begin : row_gen
            for (j = 0; j < 8; j = j + 1) begin : col_gen
                assign PP[i * 8 + j] = A[j] & B[i]; // 가중치가 낮은 순서로 저장
            end
        end
    endgenerate
    
    stage1 A1 (.A(PP[7:0]), .B(PP[15:8]), .S(S1), .E(E1));
    stage1 A2 (.A(PP[23:16]), .B(PP[31:24]), .S(S2), .E(E2));
    stage1 A3 (.A(PP[39:32]), .B(PP[47:40]), .S(S3), .E(E3));
    stage1 A4 (.A(PP[55:48]), .B(PP[63:56]), .S(S4), .E(E4));
    
    stage2 A5 (.A(S1), .B(S2), .S(S5), .E(E5));
    stage2 A6 (.A(S3), .B(S4), .S(S6), .E(E6));
    
    stage3 A7 (.A(S5), .B(S6), .S(S7), .E(E7));
    
    ErrorRecovery ER (.E3(E3), .E4(E4), .E6(E6), .E7(E7), .E(E));
    
    result result (.S(S7), .E(E), .Z(Z));
    
endmodule
