`timescale 1ns / 1ps
module ACCI2 (
    input  wire X1, X2, X3, X4,
    output wire S, C
);
    reg [1:0] result;

    always @(*) begin
        case ({X3, X4, X1, X2})  // X3X4X1X2 순서로 case 비교
            4'b0000: result = 2'b00; // Carry = 0, Sum = 0
            4'b0001: result = 2'b01; // Carry = 0, Sum = 1
            4'b0011: result = 2'b10; // Carry = 1, Sum = 0
            4'b0010: result = 2'b01; // Carry = 0, Sum = 1
            4'b0100: result = 2'b01; // Carry = 0, Sum = 1
            4'b0101: result = 2'b10; // Carry = 1, Sum = 0
            4'b0111: result = 2'b11; // Carry = 1, Sum = 1
            4'b0110: result = 2'b10; // Carry = 1, Sum = 0
            4'b1100: result = 2'b11; // Carry = 1, Sum = 1
            4'b1101: result = 2'b11; // Carry = 1, Sum = 1
            4'b1111: result = 2'b11; // Carry = 1, Sum = 1
            4'b1110: result = 2'b11; // Carry = 1, Sum = 1
            4'b1000: result = 2'b01; // Carry = 0, Sum = 1
            4'b1001: result = 2'b10; // Carry = 1, Sum = 0
            4'b1011: result = 2'b11; // Carry = 1, Sum = 1
            4'b1010: result = 2'b10; // Carry = 1, Sum = 0
            default: result = 2'b00; // 기본값 (안정성 확보)
        endcase
    end

    assign S = result[0];  // Sum 비트
    assign C = result[1];  // Carry 비트

endmodule
