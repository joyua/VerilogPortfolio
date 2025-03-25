`timescale 1ns / 1ps

module exact_multiplier (
    input [7:0] A, B,   // 8비트 입력값
    output [15:0] P     // 16비트 출력값
);
    assign P = A * B;   // 곱셈 연산 수행
    
endmodule
