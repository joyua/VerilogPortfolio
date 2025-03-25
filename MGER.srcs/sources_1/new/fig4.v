`timescale 1ns / 1ps

module fig4 (
    input [15:0] S, E,  // Sum 벡터 (S) & Error 벡터 (E)
    output [15:0] Z     // 최종 결과 벡터 (Z)
);
//    wire Zv1, Zv2, Zv3, Zv4;
//    wire Zu1, Zu2, Zu3;
//    wire C1, C2, C3, C4, C5, C6, C7, Ce;
//    wire [15:0] Carry;

//    // ? Zv, Zu, Ci 계산 (그룹별 Error Recovery, Fig.4 반영)
//    zv_zu_ci_calculator group1 (.E_v(E[5]),  .E_u(E[6]),  .S_v(S[5]),  .S_u(S[6]),  .C_i_1(1'b0),  .Z_v(Zv1), .Z_u(Zu1), .C_i(C1));
//    zv_zu_ci_calculator group2 (.E_v(E[7]),  .E_u(E[8]),  .S_v(S[7]),  .S_u(S[8]),  .C_i_1(C1),    .Z_v(Zv2), .Z_u(Zu2), .C_i(C2));
//    zv_zu_ci_calculator group3 (.E_v(E[9]),  .E_u(E[10]), .S_v(S[9]),  .S_u(S[10]), .C_i_1(C2),    .Z_v(Zv3), .Z_u(Zu3), .C_i(C3));
//    zv_zu_ci_calculator group4 (.E_v(E[11]), .E_u(1'b0),  .S_v(S[11]), .S_u(1'b0),  .C_i_1(C3),    .Z_v(Zv4), .Z_u(), .C_i(C4));  // Zu4 필요 없음


//    assign Z[0] = S[0];
//    assign Z[1] = S[1];
//    assign Z[2] = S[2];
//    assign Z[3] = S[3];
//    assign Z[4] = S[4];
//    // ? Z 벡터 구성 (그룹별 결과 적용)
//    assign Z[5] = Zv1;
//    assign Z[6] = Zu1;
//    assign Z[7] = Zv2;
//    assign Z[8] = Zu2;
//    assign Z[9] = Zv3;
//    assign Z[10] = Zu3;
//    assign Z[11] = Zv4; // group4는 Zv4까지만 계산
    

////     ? Half Adder 적용하여 Carry 처리
//    ha ha12 (.A(S[12]), .B(C4), .S(Z[12]), .C(C5));
//    ha ha13 (.A(S[13]), .B(C5), .S(Z[13]), .C(C6));
//    ha ha14 (.A(S[14]), .B(C6), .S(Z[14]), .C(C7));
//    ha ha15 (.A(S[15]), .B(C7), .S(Z[15]), .C(Ce));
    

    genvar i;
        generate 
            for( i = 0; i <16; i = i + 1) begin: sum
                assign Z[i] = S[i];
            end
        endgenerate
        

endmodule
