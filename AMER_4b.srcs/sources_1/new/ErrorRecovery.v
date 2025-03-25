`timescale 1ns / 1ps

module ErrorRecovery(
    input [8:0] E3, E4,
    input [10:0] E6,
    input [14:0] E7,
    output [3:0] E
    );
    assign E[0] = E3[7] | E4[5] | E6[7] | E7[11];
    assign E[1] = E3[8] | E4[6] | E6[8] | E7[12];
    assign E[2] = E4[7] | E6[9] | E7[13];
    assign E[3] = E4[8] | E6[10] | E7[14];
    
endmodule
