`timescale 1ns / 1ps

module tb_vectormatch;

    reg  [7:0] A, B;
    wire [15:0] P_approx;

    // 중간 출력 연결용 wire
    wire [8:0]  P1_out, P2_out, P3_out, P4_out;
    wire [12:0] V_out;
    wire [14:0] S2_out, S3_out;
    wire [12:0] C2_out;
    wire [8:0]  C3_out;
    wire [2:0]  orV_out;

    // ATCM1 모듈 인스턴스화
    ATCM1 dut (
        .A(A),
        .B(B),
        .Z(P_approx),
        .P1_out(P1_out), .P2_out(P2_out), .P3_out(P3_out), .P4_out(P4_out),
        .V_out(V_out),
        .S2_out(S2_out), .C2_out(C2_out), .orV_out(orV_out),
        .S3_out(S3_out), .C3_out(C3_out)
    );

    initial begin
        // 테스트 입력 고정
        A = 8'd15;
        B = 8'd27;
        #5;

        $display("=== ATCM1 중간 값 디버깅 (A = %d, B = %d) ===", A, B);
        $display("P1  = %b", P1_out);
        $display("P2  = %b", P2_out);
        $display("P3  = %b", P3_out);
        $display("P4  = %b", P4_out);
        $display("V   = %b", V_out);
        $display("S2  = %b", S2_out);
        $display("C2  = %b", C2_out);
        $display("orV = %b", orV_out);
        $display("S3  = %b", S3_out);
        $display("C3  = %b", C3_out);
        $display("Z   = %b", P_approx);
        $display("Z(decimal) = %0d", P_approx);

        $finish;
    end

endmodule
