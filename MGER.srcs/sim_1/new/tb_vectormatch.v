`timescale 1ns / 1ps

module tb_vectormatch;

  reg [7:0] A, B;
  wire [15:0] P;
  wire [7:0] debug_S1;
  wire [6:0] debug_S2, debug_W1, debug_W2;
  wire [15:0] debug_S3, debug_C, debug_S, debug_E, debug_Z;

  approx_multiplier_8x8 dut (
    .A(A), .B(B), .P(P),
    .debug_S1(debug_S1),
    .debug_S2(debug_S2),
    .debug_W1(debug_W1),
    .debug_W2(debug_W2),
    .debug_S3(debug_S3),
    .debug_C(debug_C),
    .debug_S(debug_S),
    .debug_E(debug_E),
    .debug_Z(debug_Z)
  );

  initial begin
    A = 8'd15;
    B = 8'd27;
    #10;

    $display("A = %d, B = %d", A, B);
    $display("Exact   : %d", A * B);
    $display("Approx  : %d", P);
    $display("S1      : %b", debug_S1);
    $display("S2      : %b", debug_S2);
    $display("W1      : %b", debug_W1);
    $display("W2      : %b", debug_W2);
    $display("S3      : %b", debug_S3);
    $display("C       : %b", debug_C);
    $display("S       : %b", debug_S);
    $display("E       : %b", debug_E);
    $display("Z       : %b", debug_Z);

    $finish;
  end

endmodule
