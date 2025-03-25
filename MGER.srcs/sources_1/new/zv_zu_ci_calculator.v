`timescale 1ns / 1ps

module zv_zu_ci_calculator (
    input wire E_v, E_u,  // E_v, E_u 입력값
    input wire S_v, S_u,  // S_v, S_u 입력값
    input wire C_i_1,     // 이전 Carry 값 C_{i-1}
    output wire Z_v, Z_u, // Zv, Zu 출력
    output wire C_i       // 다음 Carry 값 C_i 출력
);

    // Zv 계산
    assign Z_v = (~E_v & (S_v ^ C_i_1)) | (E_v & C_i_1);

    // Zu 계산
    assign Z_u = (S_u & ~E_u) ^ ((S_v & C_i_1) | E_v);

    // Ci 계산
    assign C_i = (E_u | (E_v & S_u)) | (S_v & S_u & C_i_1);

endmodule
