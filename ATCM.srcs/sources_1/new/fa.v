`timescale 1ns / 1ps

module fa (
    input A, B, Cin,  // �� �Է� ��Ʈ(A, B)�� ���� �ڸ����� �ö�� Carry (Cin)
    output S, C  // Sum(��)�� Carry ��� (Cout)
);
    assign S = A ^ B ^ Cin;  // XOR �������� �� ���
    assign C = (A & B) | (B & Cin) | (A & Cin);  // Carry ����
endmodule
