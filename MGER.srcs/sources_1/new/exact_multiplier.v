`timescale 1ns / 1ps

module exact_multiplier (
    input [7:0] A, B,   // 8��Ʈ �Է°�
    output [15:0] P     // 16��Ʈ ��°�
);
    assign P = A * B;   // ���� ���� ����
    
endmodule
