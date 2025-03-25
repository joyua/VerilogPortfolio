`timescale 1ns / 1ps
module stage3(
    input [14:0] A,
    input [12:0] B,
    input [2:0] orV,
    output [14:0] S,
    output [8:0] C
    );
    
    genvar k, j, l, m, n;
    generate
        for(k=0; k<2; k = k+1) begin : a
            assign S[k] = A[k];
        end
        for (j=6; j<15; j = j+1) begin : b
            assign S[j] = A[j];
        end   
        for (l=2; l<6; l = l+1) begin : c
            assign S[l] = A[l] | B[l-2];
        end
        for (m=0; m<3; m = m+1) begin : d
            assign C[m] = B[m+4] | orV[m];
        end
        for (n=3; n<9; n = n+1) begin : e
            assign C[n] = B[n+4];
        end
    endgenerate  

endmodule
