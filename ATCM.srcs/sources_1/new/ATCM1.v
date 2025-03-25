`timescale 1ns / 1ps

module ATCM1(
    input [7:0] A, B,
    output [15:0] Z,
    output [8:0] P1_out, P2_out, P3_out, P4_out,
    output [12:0] V_out,
    output [14:0] S2_out,
    output [12:0] C2_out,
    output [2:0]  orV_out,
    output [14:0] S3_out,
    output [8:0]  C3_out
    );
    wire [8:0] P1, P2, P3, P4;
    wire [12:0] V;
    wire [14:0] S_stage2, S_stage3;
    wire [12:0] C_stage2;
    wire [8:0] C_stage3;
    wire [2:0] orV;
    
        // 중간 출력 연결
    assign P1_out = P1;
    assign P2_out = P2;
    assign P3_out = P3;
    assign P4_out = P4;
    assign V_out = V;
    assign S2_out = S_stage2;
    assign C2_out = C_stage2;
    assign orV_out = orV;
    assign S3_out = S_stage3;
    assign C3_out = C_stage3;
    
    
    stage1 stage1 (.A(A), .B(B), .P1(P1), .P2(P2), .P3(P3), .P4(P4), .V(V));
    stage2 stage2 (.P1(P1), .P2(P2), .P3(P3), .P4(P4), .V(V), .S(S_stage2), .C(C_stage2), .orV(orV));
    stage3 stage3 (.A(S_stage2), .B(C_stage2), .orV(orV), .S(S_stage3), .C(C_stage3));
    stage4 stage4 (.S(S_stage3), .C(C_stage3), .Z(Z));
  
    
endmodule
