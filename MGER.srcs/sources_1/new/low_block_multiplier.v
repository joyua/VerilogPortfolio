`timescale 1ns / 1ps

module low_block_multiplier(
    input [3:0] A_L, B_L,
    output [6:0] S2  // 7��Ʈ ���
);
    wire [15:0] pp_flat;  // 4x4 Partial Product Matrix�� 1D�� ��ȯ

    genvar i, j;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                assign pp_flat[i * 4 + j] = A_L[i] & B_L[j];  // 2D�� 1D�� ��ȯ�Ͽ� ����
            end
        end
    endgenerate

    // OR ������ ����Ͽ� S2 ��� (�� ���� ���� OR�� �ջ�)
    assign S2[0] = pp_flat[0];  // 1-bit
    assign S2[1] = pp_flat[1] | pp_flat[4];
    assign S2[2] = pp_flat[2] | pp_flat[5] | pp_flat[8];
    assign S2[3] = pp_flat[3] | pp_flat[6] | pp_flat[9] | pp_flat[12];
    assign S2[4] = pp_flat[7] | pp_flat[10] | pp_flat[13];
    assign S2[5] = pp_flat[11] | pp_flat[14];
    assign S2[6] = pp_flat[15];  // MSB ��Ʈ

endmodule
