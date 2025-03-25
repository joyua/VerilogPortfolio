`timescale 1ns / 1ps

module inexact_8to2_compressor(input p1, p2, p3, p4, p5, p6, p7, p8, output W1, W2);
    assign W1 = p1 | p2 | p3 | p4 | p5 | p6 | p7 | p8;
    assign W2 = (p1 & (p2 | p3 | p4 | p5 | p6 | p7 | p8)) | 
                (p2 & (p3 | p4 | p5 | p6 | p7 | p8)) | 
                (p3 & (p4 | p5 | p6 | p7 | p8)) | 
                (p4 & (p5 | p6 | p7 | p8)) | 
                (p5 & (p6 | p7 | p8)) | 
                (p6 & (p7 | p8)) | 
                (p7 & p8);
endmodule
