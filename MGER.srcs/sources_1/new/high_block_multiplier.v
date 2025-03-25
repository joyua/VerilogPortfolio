`timescale 1ns / 1ps

module high_block_multiplier (
    input [3:0] A_H, B_H,
    output [7:0] S1
);
    wire [15:0] pp;  // 4x4 부분곱 행렬을 1D 배열로 변환
    wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12;
    wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12;

    genvar i, j;
    generate
        for (i = 0; i < 4; i = i + 1) begin : row
            for (j = 0; j < 4; j = j + 1) begin : col
                assign pp[i * 4 + j] = A_H[i] & B_H[j];  // 2D 배열을 1D로 변환
            end
        end
    endgenerate
    
    ha ha1 (.A(pp[9]), .B(pp[12]), .S(s1), .C(c1));
    ha ha2 (.A(pp[10]), .B(pp[13]), .S(s2), .C(c2));
    ha ha3 (.A(pp[5]), .B(pp[8]), .S(s3), .C(c3));
    ha ha7 (.A(pp[1]), .B(pp[4]), .S(s7), .C(c7));
    
    fa fa4 (.A(s1), .B(pp[3]), .Cin(pp[6]), .S(s4), .C(c4));
    fa fa5 (.A(c1), .B(s2), .Cin(pp[7]), .S(s5), .C(c5));
    fa fa6 (.A(c2), .B(pp[11]), .Cin(pp[14]), .S(s6), .C(c6));
    fa fa8 (.A(s3), .B(pp[2]), .Cin(c7), .S(s8), .C(c8));
    fa fa9 (.A(c3), .B(s4), .Cin(c8), .S(s9), .C(c9));
    fa fa10 (.A(c4), .B(s5), .Cin(c9), .S(s10), .C(c10));
    fa fa11 (.A(c5), .B(s6), .Cin(c10), .S(s11), .C(c11));
    fa fa12 (.A(c6), .B(pp[15]), .Cin(c11), .S(s12), .C(c12));

    assign S1[0] = pp[0];
    assign S1[1] = s7;
    assign S1[2] = s8;
    assign S1[3] = s9;
    assign S1[4] = s10;
    assign S1[5] = s11;
    assign S1[6] = s12;
    assign S1[7] = c12;
    
endmodule
