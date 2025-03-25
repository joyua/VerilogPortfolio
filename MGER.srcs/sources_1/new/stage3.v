`timescale 1ns / 1ps

module stage3 (
    input [15:0] S3, C,
    output [15:0] S, E
);
    wire [16:0] Carry;
    // Inexact Half Adder를 적용할 위치
    wire [6:0] inHA_E;
    assign Carry[0] = 1'b0;
    // Inexact Half Adder 인스턴스
    genvar i, j;
    generate
        for (i = 5; i <= 11; i = i + 1) begin : inHA
            inexact_half_adder inHA_inst (
                .p1(S3[i]), .p2(C[i]),
                .W2(inHA_E[i - 5])   // W2가 E에 저장됨
            );
        end
        
        for (j = 0; j <= 15; j = j + 1) begin : Sum_Loop
            fa fa_loop (.A(S3[j]), .B(C[j]), .Cin(Carry[j]), .S(S[j]), .C(Carry[j+1]));
        end
                    
    endgenerate


    // E 벡터: inHA 적용된 값 반영
    assign E[5]  = inHA_E[0];
    assign E[6]  = inHA_E[1];
    assign E[7]  = inHA_E[2];
    assign E[8]  = inHA_E[3];
    assign E[9]  = inHA_E[4];
    assign E[10] = inHA_E[5];
    assign E[11] = inHA_E[6];

    // 나머지 E 값들은 0으로 설정
    assign E[0] = 0;
    assign E[1] = 0;
    assign E[2] = 0;
    assign E[3] = 0;
    assign E[4] = 0;
    assign E[12] = 0;
    assign E[13] = 0;
    assign E[14] = 0;
    assign E[15] = 0;

endmodule

