`timescale 1ns / 1ps

module stage4(
    input [14:0] S,
    input [8:0] C,
    output [15:0] Z
    );
    
    wire [15:6] Carry;
    assign Carry[6] = 1'b0;    
           
    genvar i, a;
    generate
        for (i = 6; i <= 14; i = i + 1) begin: CPA_FA_Loop
            fa fa_inst (
                .A(S[i]),
                .B(C[i-6]),  // C[8:0]을 순차적으로 연결
                .Cin(Carry[i]), 
                .S(Z[i]), 
                .C(Carry[i+1])
            );
        end
        for (a = 0; a < 6; a = a + 1) begin: Z_sum
            assign Z[a] = S[a];
        end        
    endgenerate    
    assign Z[15] = Carry[15];
    
endmodule
