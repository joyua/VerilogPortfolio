`timescale 1ns / 1ps

module stage2 (
    input [8:0] A, B,  // 9-bit �Է�
    output [10:0] S, E  // 11-bit ��� (9-bit ���� + 2�� �߰�)
);

    genvar i;
    generate
        for (i = 3; i < 9; i = i + 1) begin : stage2_calc
            assign S[i] = (A[i] ^ B[i-2]) | (A[i-1] & B[i-3]);  // �� �� (5)
            assign E[i] = (A[i] ^ B[i-2]) & (A[i-1] & B[i-3]);  // �� �� (6)
        end
    endgenerate

    // A[2]�� B[0]�� ����� ù ��° ���� - B[i-1]�� 0���� ����
    assign S[2] = (A[2] ^ B[0]) | (A[1] & 1'b0);
    assign E[2] = (A[2] ^ B[0]) & (A[1] & 1'b0);

    // A[1:0]�� S[1:0]�� �״�� �ݿ�, E[1:0]�� �����ϰ� ����
    assign S[1:0] = A[1:0];
    assign E[1:0] = 1'b0;

    // B[7:6]�� S[10:9]�� �״�� �ݿ�, E[10:9]�� �����ϰ� ����
    assign S[9] = (1'b0 ^ B[7]) | (A[8] & B[6]); 
    assign E[9] = (1'b0 ^ B[7]) & (A[8] & B[6]);   
    
    assign S[10] = (1'b0 ^ B[8]) | (1'b0 & B[7]);
    assign E[10] = (1'b0 ^ B[8]) & (1'b0 & B[7]); 

endmodule

