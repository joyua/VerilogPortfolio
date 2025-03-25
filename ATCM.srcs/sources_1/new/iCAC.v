`timescale 1ns / 1ps

module iCAC(
    input A, B,
    output P, Q
    );
    assign P = A | B;
    assign Q = A & B;
endmodule
