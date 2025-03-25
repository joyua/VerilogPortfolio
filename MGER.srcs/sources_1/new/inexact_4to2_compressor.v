`timescale 1ns / 1ps

module inexact_4to2_compressor(input p1, p2, p3, p4, output W1, W2);
    assign W1 = p1 | p2 | p3 | p4;
    assign W2 = (p1 & (p2 | p3 | p4)) | (p2 & (p3 | p4)) | (p3 & p4);
endmodule

