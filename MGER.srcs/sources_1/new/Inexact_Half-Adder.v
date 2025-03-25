`timescale 1ns / 1ps

module inexact_half_adder(input p1, p2, output W1, W2);
    assign W1 = p1 | p2;  // OR ����
    assign W2 = p1 & p2;  // AND ����
endmodule
