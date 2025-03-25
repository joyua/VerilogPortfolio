`timescale 1ns / 1ps


module tb_debug;

    reg [7:0] A, B;
    wire [14:0] R1, R2, R3, R4;
    
    Stage1 st1 (.A(A), .B(B),. R1(R1), .R2(R2), .R3(R3), .R4(R4));
    
    initial begin
        $dumpfile("tb_debug.vcd");  // GTKWave 시뮬레이션을 위한 덤프 파일
        $dumpvars(0, tb_debug);

        // 테스트 케이스 1: A = 8'b00000000, B = 8'b00000000
        A = 8'b00000000;
        B = 8'b00000000;
        #10;

        // 테스트 케이스 2: A = 8'b00000001, B = 8'b00000001
        A = 8'b00000001;
        B = 8'b00000001;
        #10;

        // 테스트 케이스 3: A = 8'b00000010, B = 8'b00000010
        A = 8'b00000010;
        B = 8'b00000010;
        #10;

        // 테스트 케이스 4: A = 8'b00001111, B = 8'b00001111
        A = 8'b00001111;
        B = 8'b00001111;
        #10;

        // 테스트 케이스 5: A = 8'b11111111, B = 8'b11111111
        A = 8'b11111111;
        B = 8'b11111111;
        #10;

        // 다양한 랜덤 테스트 추가
        A = $random;
        B = $random;
        #10;

        A = $random;
        B = $random;
        #10;

        A = $random;
        B = $random;
        #10;

        // 시뮬레이션 종료
        $finish;
    end

    // 출력 모니터링
    initial begin
        $monitor("Time = %0t | A = %b, B = %b | R1 = %b | R2 = %b | R3 = %b | R4 = %b",
                 $time, A, B, R1, R2, R3, R4);
    end

endmodule
