`timescale 1ns / 1ps
module stage2(
    input [8:0] P1, P2, P3, P4,
    input [12:0] V,
    output [14:0] S,
    output [12:0] C,
    output [2:0] orV
    );
    assign S[0] = P1[0];
    ha ha1 (.A(P1[1]), .B(V[0]), .S(S[1]), .C(C[0]));
    fa fa1 (.A(P1[2]), .B(P2[0]), .Cin(V[1]), .S(S[2]), .C(C[1]));
    fa fa2 (.A(P1[3]), .B(P2[1]), .Cin(V[2]), .S(S[3]), .C(C[2]));
    ACCI2 ACCI1 (.X1(P1[4]), .X2(P2[2]), .X3(P3[0]), .X4(V[3]), .S(S[4]), .C(C[3]));
    ACCI2 ACCI2 (.X1(P1[5]), .X2(P2[3]), .X3(P3[1]), .X4(V[4]), .S(S[5]), .C(C[4]));
    ACCI2 ACCI3 (.X1(P1[6]), .X2(P2[4]), .X3(P3[2]), .X4(P4[0]), .S(S[6]), .C(C[5]));
    ACCI2 ACCI4 (.X1(P1[7]), .X2(P2[5]), .X3(P3[3]), .X4(P4[1]), .S(S[7]), .C(C[6]));
    ACCI2 ACCI5 (.X1(P1[8]), .X2(P2[6]), .X3(P3[4]), .X4(P4[2]), .S(S[8]), .C(C[7]));
    ACCI2 ACCI6 (.X1(P2[7]), .X2(P3[5]), .X3(P4[3]), .X4(V[8]), .S(S[9]), .C(C[8]));
    ACCI2 ACCI7 (.X1(P2[8]), .X2(P3[6]), .X3(P4[4]), .X4(V[9]), .S(S[10]), .C(C[9]));
    fa fa3 (.A(P3[7]), .B(P4[5]), .Cin(V[10]), .S(S[11]), .C(C[10]));
    fa fa4 (.A(P3[8]), .B(P4[6]), .Cin(V[11]), .S(S[12]), .C(C[11]));
    ha ha2 (.A(P4[7]), .B(V[12]), .S(S[13]), .C(C[12]));
    assign S[14] = P4[8];
    assign orV[0] = V[5];
    assign orV[1] = V[6];
    assign orV[2] = V[7];    
endmodule
