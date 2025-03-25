module CLAM2(
    input [7:0] A, B,
    output [15:0] S,

    output [63:0] pp_out,
    output [14:0] R1_out, R2_out, R3_out, R4_out,
    output [14:0] S1_out, S2_out, S3_out,
    output [14:0] C1_out, C2_out, C3_out
);

    wire [63:0] pp;
    wire [14:0] R1, R2, R3, R4;
    wire [14:0] S1, S2, S3;
    wire [14:0] C1, C2, C3;

    assign pp_out = pp;
    assign R1_out = R1;
    assign R2_out = R2;
    assign R3_out = R3;
    assign R4_out = R4;
    assign S1_out = S1;
    assign S2_out = S2;
    assign S3_out = S3;
    assign C1_out = C1;
    assign C2_out = C2;
    assign C3_out = C3;

    Stage1 u1 (.A(A), .B(B), .pp(pp));
    Stage2 u2 (.pp(pp), .R1(R1), .R2(R2), .R3(R3), .R4(R4));
    SDLC_result u3 (.R1(R1), .R2(R2), .R3(R3), .R4(R4), .S1(S1), .C1(C1), .S2(S2), .C2(C2), .S3(S3), .C3(C3), .S(S));

endmodule
