`timescale 1ns / 1ps

module zv_zu_ci_calculator (
    input wire E_v, E_u,  // E_v, E_u �Է°�
    input wire S_v, S_u,  // S_v, S_u �Է°�
    input wire C_i_1,     // ���� Carry �� C_{i-1}
    output wire Z_v, Z_u, // Zv, Zu ���
    output wire C_i       // ���� Carry �� C_i ���
);

    // Zv ���
    assign Z_v = (~E_v & (S_v ^ C_i_1)) | (E_v & C_i_1);

    // Zu ���
    assign Z_u = (S_u & ~E_u) ^ ((S_v & C_i_1) | E_v);

    // Ci ���
    assign C_i = (E_u | (E_v & S_u)) | (S_v & S_u & C_i_1);

endmodule
