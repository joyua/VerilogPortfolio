`timescale 1ns / 1ps

module result(
    input [14:0] S,
    input [3:0] E,
    output [15:0] Z
    );
    wire [15:11] Carry;
    assign Carry[11] = 1'b0;  
      
    genvar i, j;
    generate
        for (i = 11; i <= 14; i = i + 1) begin: CPA_FA_Loop
            fa fa_inst (
                .A(S[i]),
                .B(E[i-11]), 
                .Cin(Carry[i]), 
                .S(Z[i]), 
                .C(Carry[i+1])
            );
        end   
        for (j = 0; j <=10; j = j + 1) begin: Z_sum
            assign Z[j] = S[j];
        end
    endgenerate    
    
    assign Z[15] = Carry[15];  
    
endmodule
