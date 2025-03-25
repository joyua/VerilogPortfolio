`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/02 15:01:22
// Design Name: 
// Module Name: inexact_6to2_compressor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module inexact_6to2_compressor(input p1, p2, p3, p4, p5, p6, output W1, W2);
    assign W1 = p1 | p2 | p3 | p4 | p5 | p6;
    assign W2 = (p1 & (p2 | p3 | p4 | p5 | p6)) | 
                (p2 & (p3 | p4 | p5 | p6)) | 
                (p3 & (p4 | p5 | p6)) | 
                (p4 & (p5 | p6)) | 
                (p5 & p6);
endmodule

