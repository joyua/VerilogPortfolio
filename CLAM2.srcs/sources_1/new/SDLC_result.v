`timescale 1ns / 1ps
module SDLC_result(
    input [14:0] R1, R2, R3, R4,
    output [14:0] S1, C1, S2, C2, S3, C3,
    output [15:0] S
    );
    

    
    genvar i;
    
    // ? 첫 번째 Carry-Save Adder (R1 + R2)
    generate
        for (i = 0; i < 15; i = i + 1) begin: CSA1
            ha ha1 (.A(R1[i]), .B(R2[i]), .S(S1[i]), .C(C1[i]));  // Half Adder
        end
    endgenerate
    
    // ? 두 번째 Carry-Save Adder (R3 + R4)
    generate
        for (i = 0; i < 15; i = i + 1) begin: CSA2
            ha ha2 (.A(R3[i]), .B(R4[i]), .S(S2[i]), .C(C2[i]));
        end
    endgenerate
    
    // ? 세 번째 Carry-Save Adder (S1 + S2)
    generate
        for (i = 0; i < 15; i = i + 1) begin: CSA3
            ha ha3 (.A(S1[i]), .B(S2[i]), .S(S3[i]), .C(C3[i]));
        end
    endgenerate

    // ? 마지막 단계에서 Carry 처리 (CPA 대신 간단한 덧셈)
    assign S = {1'b0, S3} + {C1[14:0], 1'b0} + {C2[14:0], 1'b0} + {C3[14:0], 1'b0};

endmodule
