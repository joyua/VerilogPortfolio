`timescale 1ns / 1ps

module tb_vectormatch;

    reg [7:0] A, B;
    wire [15:0] S;
    wire [63:0] pp_out;
    wire [14:0] R1_out, R2_out, R3_out, R4_out;
    wire [14:0] S1_out, S2_out, S3_out;
    wire [14:0] C1_out, C2_out, C3_out;

    CLAM2 uut (
        .A(A), .B(B), .S(S),
        .pp_out(pp_out),
        .R1_out(R1_out), .R2_out(R2_out), .R3_out(R3_out), .R4_out(R4_out),
        .S1_out(S1_out), .S2_out(S2_out), .S3_out(S3_out),
        .C1_out(C1_out), .C2_out(C2_out), .C3_out(C3_out)
    );

    initial begin
        A = 8'd15;
        B = 8'd27;
        #5;

        $display("===== CLAM2 Vector Matching =====");
        $display("A = %d, B = %d", A, B);
        $display("pp  = %b", pp_out);
        $display("R1  = %b", R1_out);
        $display("R2  = %b", R2_out);
        $display("R3  = %b", R3_out);
        $display("R4  = %b", R4_out);
        $display("S1  = %b", S1_out);
        $display("C1  = %b", C1_out);
        $display("S2  = %b", S2_out);
        $display("C2  = %b", C2_out);
        $display("S3  = %b", S3_out);
        $display("C3  = %b", C3_out);
        $display("Final S (Product) = %b", S);
        $display("Final S (Decimal) = %0d", S);

        $finish;
    end

endmodule
