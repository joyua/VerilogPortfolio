`timescale 1ns / 1ps

module stage3 (
    input [10:0] A, B,  // 11-bit �Է�
    output [14:0] S, E  // 15-bit ���
);

    genvar i;
    generate
        for (i = 5; i < 11; i = i + 1) begin : stage3_calc
            assign S[i] = (A[i] ^ B[i-4]) | (A[i-1] & B[i-5]);  // �� �� (5)
            assign E[i] = (A[i] ^ B[i-4]) & (A[i-1] & B[i-5]);  // �� �� (6)
        end
    endgenerate
    
        // A[3:0]�� S[3:0]�� �״�� �ݿ�, E[3:0]�� �����ϰ� ����
    assign S[3:0] = A[3:0];
    assign E[3:0] = 1'b0;

    // A[4]�� B[0]�� ����� ù ��° ���� - B[i-1]�� 0���� ����
    assign S[4] = (A[4] ^ B[0]) | (A[3] & 1'b0);
    assign E[4] = (A[4] ^ B[0]) & (A[3] & 1'b0);
    
    assign S[11] = (1'b0 ^ B[7]) | (A[10] & B[6]);
    assign E[11] = (1'b0 ^ B[7]) & (A[10] & B[6]);
    
    assign S[12] = (1'b0 ^ B[8]) | (1'b0 & B[7]);
    assign E[12] = (1'b0 ^ B[8]) & (1'b0 & B[7]);
    
    assign S[13] = (1'b0 ^ B[9]) | (1'b0 & B[8]);
    assign E[13] = (1'b0 ^ B[9]) & (1'b0 & B[8]);

    assign S[14] = (1'b0 ^ B[10]) | (1'b0 & B[9]);
    assign E[14] = (1'b0 ^ B[10]) & (1'b0 & B[9]);
   

endmodule

