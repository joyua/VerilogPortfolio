`timescale 1ns / 1ps

module stage1 (
    input [7:0] A, B,  // 8-bit �Է�
    output [8:0] S, E  // 9-bit ��� (8-bit + Carry-out)
);

    genvar i;
    generate
        for (i = 2; i < 8; i = i + 1) begin : stage1_calc
            assign S[i] = (A[i] ^ B[i-1]) | (A[i-1] & B[i-2]);  // �� �� (5)
            assign E[i] = (A[i] ^ B[i-1]) & (A[i-1] & B[i-2]);  // �� �� (6)
        end
    endgenerate

    // ù ��° ��Ʈ (A[1], B[0]) ���� - B[i-1]�� 0���� ����
    assign S[1] = (A[1] ^ B[0]) | (A[0] & 1'b0);
    assign E[1] = (A[1] ^ B[0]) & (A[0] & 1'b0);

    // A[0]�� B[7]�� S[0]�� S[8]�� �ݿ�, E[0]�� E[8]���� �ݿ�
    assign S[0] = A[0];  // A[0]�� �״�� S[0]�� �ݿ�
    assign E[0] = 1'b0;      // ������ 0���� ����

    assign S[8] = (1'b0 ^ B[7]) | (A[7] & B[6]); 
    assign E[8] = (1'b0 ^ B[7]) & (A[7] & B[6]);     

endmodule