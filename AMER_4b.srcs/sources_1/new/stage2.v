`timescale 1ns / 1ps

module stage2 (
    input [8:0] A, B,  // 9-bit 입력
    output [10:0] S, E  // 11-bit 출력 (9-bit 연산 + 2개 추가)
);

    genvar i;
    generate
        for (i = 3; i < 9; i = i + 1) begin : stage2_calc
            assign S[i] = (A[i] ^ B[i-2]) | (A[i-1] & B[i-3]);  // 논문 식 (5)
            assign E[i] = (A[i] ^ B[i-2]) & (A[i-1] & B[i-3]);  // 논문 식 (6)
        end
    endgenerate

    // A[2]와 B[0]을 사용한 첫 번째 연산 - B[i-1]을 0으로 설정
    assign S[2] = (A[2] ^ B[0]) | (A[1] & 1'b0);
    assign E[2] = (A[2] ^ B[0]) & (A[1] & 1'b0);

    // A[1:0]을 S[1:0]에 그대로 반영, E[1:0]도 동일하게 설정
    assign S[1:0] = A[1:0];
    assign E[1:0] = 1'b0;

    // B[7:6]을 S[10:9]에 그대로 반영, E[10:9]도 동일하게 설정
    assign S[9] = (1'b0 ^ B[7]) | (A[8] & B[6]); 
    assign E[9] = (1'b0 ^ B[7]) & (A[8] & B[6]);   
    
    assign S[10] = (1'b0 ^ B[8]) | (1'b0 & B[7]);
    assign E[10] = (1'b0 ^ B[8]) & (1'b0 & B[7]); 

endmodule

