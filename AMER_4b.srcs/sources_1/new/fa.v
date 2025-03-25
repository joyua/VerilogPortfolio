`timescale 1ns / 1ps

module fa (
    input A, B, Cin,  // 두 입력 비트(A, B)와 이전 자리에서 올라온 Carry (Cin)
    output S, C  // Sum(합)과 Carry 출력 (Cout)
);
    assign S = A ^ B ^ Cin;  // XOR 연산으로 합 계산
    assign C = (A & B) | (B & Cin) | (A & Cin);  // Carry 생성
endmodule
