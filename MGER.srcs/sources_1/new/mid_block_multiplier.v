`timescale 1ns / 1ps

module mid_block_multiplier (
    input [3:0] A_H, A_L, B_H, B_L,  // 상위 4비트 & 하위 4비트 입력
    output [6:0] W1, W2  // 압축된 결과 (W1[6:0], W2[6:0])
);
    wire [15:0] P_HL, P_LH;  // Partial Products (1D 배열)
    wire [7:0] mid_block [6:0];  // Mid Block에서 비트별로 그룹화된 Partial Products

    // Partial Products 생성 (1D 배열 활용)
    genvar i, j;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                assign P_HL[i * 4 + j] = A_L[i] & B_H[j];  // A_L × B_H
                assign P_LH[i * 4 + j] = A_H[i] & B_L[j];  // A_H × B_L
            end
        end
    endgenerate

    // Mid Block 비트별 그룹화
    assign mid_block[0] = {P_HL[0], P_LH[0]};  // 2개
    assign mid_block[1] = {P_HL[1], P_LH[1], P_HL[4], P_LH[4]};  // 4개
    assign mid_block[2] = {P_HL[2], P_LH[2], P_HL[5], P_LH[5], P_HL[8], P_LH[8]};  // 6개
    assign mid_block[3] = {P_HL[3], P_LH[3], P_HL[6], P_LH[6], P_HL[9], P_LH[9], P_HL[12], P_LH[12]};  // 8개
    assign mid_block[4] = {P_HL[7], P_LH[7], P_HL[10], P_LH[10], P_HL[13], P_LH[13]};  // 6개
    assign mid_block[5] = {P_HL[11], P_LH[11], P_HL[14], P_LH[14]};  // 4개
    assign mid_block[6] = {P_HL[15], P_LH[15]};  // 2개

    // Inexact Compressors 적용
    inexact_half_adder comp_inHA_0 (.p1(mid_block[0][0]), .p2(mid_block[0][1]), .W1(W1[0]), .W2(W2[0]));
    inexact_half_adder comp_inHA_6 (.p1(mid_block[6][0]), .p2(mid_block[6][1]), .W1(W1[6]), .W2(W2[6]));

    inexact_4to2_compressor comp_4_2_1 (.p1(mid_block[1][0]), .p2(mid_block[1][1]), .p3(mid_block[1][2]), .p4(mid_block[1][3]), .W1(W1[1]), .W2(W2[1]));
    inexact_4to2_compressor comp_4_2_5 (.p1(mid_block[5][0]), .p2(mid_block[5][1]), .p3(mid_block[5][2]), .p4(mid_block[5][3]), .W1(W1[5]), .W2(W2[5]));

    inexact_6to2_compressor comp_6_2_2 (.p1(mid_block[2][0]), .p2(mid_block[2][1]), .p3(mid_block[2][2]), .p4(mid_block[2][3]), .p5(mid_block[2][4]), .p6(mid_block[2][5]), .W1(W1[2]), .W2(W2[2]));
    inexact_6to2_compressor comp_6_2_4 (.p1(mid_block[4][0]), .p2(mid_block[4][1]), .p3(mid_block[4][2]), .p4(mid_block[4][3]), .p5(mid_block[4][4]), .p6(mid_block[4][5]), .W1(W1[4]), .W2(W2[4]));

    inexact_8to2_compressor comp_8_2_3 (.p1(mid_block[3][0]), .p2(mid_block[3][1]), .p3(mid_block[3][2]), .p4(mid_block[3][3]), 
                                        .p5(mid_block[3][4]), .p6(mid_block[3][5]), .p7(mid_block[3][6]), .p8(mid_block[3][7]), 
                                        .W1(W1[3]), .W2(W2[3]));

endmodule
