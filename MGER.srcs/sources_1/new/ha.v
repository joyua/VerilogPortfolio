`timescale 1ns / 1ps

module ha (
    input A, B,  // �� �Է� ��Ʈ (A, B)
    output S, C  // Sum(��)�� Carry ��� (Cout)
);
    assign S = A ^ B;  // XOR �������� �� ���
    assign C = A & B;  // AND �������� Carry ���
endmodule
