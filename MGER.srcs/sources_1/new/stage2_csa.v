`timescale 1ns / 1ps

module stage2_csa (
    input [7:0] S1,     // High Block ��� (8��Ʈ)
    input [6:0] S2,     // Low Block ��� (7��Ʈ)
    input [6:0] W1, W2, // Mid Block ���� ��� (7��Ʈ)
    output [15:0] S3,   // CSA ��� (Sum ����)
    output [15:0] C     // CSA ��� (Carry ����)
);

    // ? Full Adder (FA) �ν��Ͻ�ȭ
    fa fa1  (.A(S2[4]), .B(W1[0]), .Cin(W2[0]), .S(S3[4]), .C(C[5]));
    fa fa2  (.A(S2[5]), .B(W1[1]), .Cin(W2[1]), .S(S3[5]), .C(C[6]));
    fa fa3  (.A(S2[6]), .B(W1[2]), .Cin(W2[2]), .S(S3[6]), .C(C[7]));
    fa fa4  (.A(S1[0]), .B(W1[4]), .Cin(W2[4]), .S(S3[8]), .C(C[9]));
    fa fa5  (.A(S1[1]), .B(W1[5]), .Cin(W2[5]), .S(S3[9]), .C(C[10]));
    fa fa6  (.A(S1[2]), .B(W1[6]), .Cin(W2[6]), .S(S3[10]), .C(C[11]));

    // ? Half Adder (HA) �ν��Ͻ�ȭ
    ha ha1  (.A(W1[3]), .B(W2[3]), .S(S3[7]), .C(C[8]));

    // ? S1[3:7]�� S2[0:3]�� S3�� �״�� �ݿ�
    assign S3[0]  = S2[0];
    assign S3[1]  = S2[1];
    assign S3[2]  = S2[2];
    assign S3[3]  = S2[3];
    

    assign S3[11] = S1[3];
    assign S3[12] = S1[4];
    assign S3[13] = S1[5];
    assign S3[14] = S1[6];
    assign S3[15] = S1[7];

    // ? C�� ������ ��Ʈ�� 0���� �ʱ�ȭ
    assign C[0] = 0;
    assign C[1] = 0;
    assign C[2] = 0;
    assign C[3] = 0;
    assign C[4] = 0;
    assign C[12] = 0;
    assign C[13] = 0;
    assign C[14] = 0;
    assign C[15] = 0;

endmodule
