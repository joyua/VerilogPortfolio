`timescale 1ns / 1ps

module ha (
    input A, B,  // 두 입력 비트 (A, B)
    output S, C  // Sum(합)과 Carry 출력 (Cout)
);
    assign S = A ^ B;  // XOR 연산으로 합 계산
    assign C = A & B;  // AND 연산으로 Carry 계산
endmodule