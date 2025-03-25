`timescale 1ns / 1ps

// Stage1 정의
module stage1 (
    input  [7:0] A, B,
    output [8:0] P1, P2, P3, P4, // 9비트 P 벡터
    output [12:0] V // 오류 보정 벡터 (13비트)
);

    wire [63:0] PP;  // 64개의 1차원 배열로 PP 저장
    wire [6:0] Q1, Q2, Q3, Q4; // Q 벡터들 (7비트)

    // Partial Product (PP) 1차원 배열 생성 (64개)
    genvar i, j;
    generate
        for (i = 0; i < 8; i = i + 1) begin : row_gen
            for (j = 0; j < 8; j = j + 1) begin : col_gen
                assign PP[i * 8 + j] = A[j] & B[i]; // 가중치가 낮은 순서로 저장
            end
        end
    endgenerate

    // iCAC를 사용하여 P, Q 생성 (7개씩 묶음, 첫 번째 & 마지막 부분곱 포함)
    genvar k;
    generate
        // P 벡터의 첫 번째 요소: iCAC 적용되지 않은 부분곱 중 낮은 가중치 값
        assign P1[0] = PP[0];  
        assign P2[0] = PP[16]; 
        assign P3[0] = PP[32]; 
        assign P4[0] = PP[48]; 

        // iCAC 적용 (7개씩 묶음)
        for (k = 1; k < 8; k = k + 1) begin : icac_block
            iCAC icac1 (.A(PP[k]),    .B(PP[k+7]),   .P(P1[k]), .Q(Q1[k-1]));
            iCAC icac2 (.A(PP[k+16]), .B(PP[k+23]),  .P(P2[k]), .Q(Q2[k-1]));
            iCAC icac3 (.A(PP[k+32]), .B(PP[k+39]),  .P(P3[k]), .Q(Q3[k-1]));
            iCAC icac4 (.A(PP[k+48]), .B(PP[k+55]),  .P(P4[k]), .Q(Q4[k-1]));
        end

        // P 벡터의 마지막 요소: iCAC 적용되지 않은 부분곱 중 높은 가중치 값
        assign P1[8] = PP[15];  
        assign P2[8] = PP[31]; 
        assign P3[8] = PP[47]; 
        assign P4[8] = PP[63]; 
    endgenerate

    // V 벡터를 OR 게이트를 이용하여 생성 (위 그림의 구조를 반영)
    assign V[0]  = Q1[0];
    assign V[1]  = Q1[1];
    assign V[2]  = Q1[2] | Q2[0];
    assign V[3]  = Q1[3] | Q2[1];
    assign V[4]  = Q1[4] | Q2[2] | Q3[0];
    assign V[5]  = Q1[5] | Q2[3] | Q3[1];
    assign V[6]  = Q1[6] | Q2[4] | Q3[2] | Q4[0];
    assign V[7]  = Q2[5] | Q3[3] | Q4[1];
    assign V[8]  = Q2[6] | Q3[4] | Q4[2];
    assign V[9]  = Q3[5] | Q4[3];
    assign V[10] = Q3[6] | Q4[4];
    assign V[11] = Q4[5];
    assign V[12] = Q4[6];

endmodule
