`timescale 1ns / 1ps

module Stage2(
    input [63:0] pp,
    output [14:0] R1, R2, R3, R4
    );
    
    // ? 압축된 부분곱을 R1, R2, R3, R4 배열에 저장
    assign R1[0]  = pp[0];
    assign R1[1]  = pp[1];
    assign R1[2]  = pp[2];
    assign R1[3]  = pp[3];
    assign R1[4]  = pp[4];
    assign R1[5]  = pp[5];
    assign R1[6]  = pp[6];
    assign R1[7]  = pp[7];
    assign R1[8]  = pp[15];
    assign R1[9]  = pp[23];
    assign R1[10] = pp[31];
    assign R1[11] = pp[39];
    assign R1[12] = pp[47];
    assign R1[13] = pp[55];
    assign R1[14] = pp[63];

    assign R2[0]  = 0;
    assign R2[1]  = 0;
    assign R2[2]  = pp[16];
    assign R2[3]  = pp[17];
    assign R2[4]  = pp[18];
    assign R2[5]  = pp[19];
    assign R2[6]  = pp[20];
    assign R2[7]  = pp[21];
    assign R2[8]  = pp[22];
    assign R2[9]  = pp[30];
    assign R2[10] = pp[38];
    assign R2[11] = pp[46];
    assign R2[12] = pp[54];
    assign R2[13] = pp[62];
    assign R2[14] = 0;

    assign R3[0]  = 0;
    assign R3[1]  = 0;
    assign R3[2]  = 0;
    assign R3[3]  = 0;
    assign R3[4]  = pp[32];
    assign R3[5]  = pp[33];
    assign R3[6]  = pp[34];
    assign R3[7]  = pp[35];
    assign R3[8]  = pp[36];
    assign R3[9]  = pp[37];
    assign R3[10] = pp[45];
    assign R3[11] = pp[53];
    assign R3[12] = pp[61];
    assign R3[13] = 0;
    assign R3[14] = 0;

    assign R4[0]  = 0;
    assign R4[1]  = 0;
    assign R4[2]  = 0;
    assign R4[3]  = 0;
    assign R4[4]  = 0;
    assign R4[5]  = 0;
    assign R4[6]  = pp[48];
    assign R4[7]  = pp[49];
    assign R4[8]  = pp[50];
    assign R4[9]  = pp[51];
    assign R4[10] = pp[52];
    assign R4[11] = pp[60];
    assign R4[12] = 0;
    assign R4[13] = 0;
    assign R4[14] = 0;
endmodule
