`timescale 1ns / 1ps

module stage1 (
    input [7:0] A, B,  // 8-bit 입력
    output [8:0] S, E  // 9-bit 출력 (8-bit + Carry-out)
);

    genvar i;
    generate
        for (i = 2; i < 8; i = i + 1) begin : stage1_calc
            assign S[i] = (A[i] ^ B[i-1]) | (A[i-1] & B[i-2]);  // 논문 식 (5)
            assign E[i] = (A[i] ^ B[i-1]) & (A[i-1] & B[i-2]);  // 논문 식 (6)
        end
    endgenerate

    // 첫 번째 비트 (A[1], B[0]) 연산 - B[i-1]을 0으로 설정
    assign S[1] = (A[1] ^ B[0]) | (A[0] & 1'b0);
    assign E[1] = (A[1] ^ B[0]) & (A[0] & 1'b0);

    // A[0]과 B[7]을 S[0]과 S[8]에 반영, E[0]과 E[8]에도 반영
    assign S[0] = A[0];  // A[0]을 그대로 S[0]에 반영
    assign E[0] = 1'b0;      // 오류는 0으로 설정

    assign S[8] = (1'b0 ^ B[7]) | (A[7] & B[6]); 
    assign E[8] = (1'b0 ^ B[7]) & (A[7] & B[6]);     

endmodule