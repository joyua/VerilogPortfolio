`timescale 1ns / 1ps


module tb_debug;

    reg [7:0] A, B;
    wire [14:0] R1, R2, R3, R4;
    
    Stage1 st1 (.A(A), .B(B),. R1(R1), .R2(R2), .R3(R3), .R4(R4));
    
    initial begin
        $dumpfile("tb_debug.vcd");  // GTKWave �ùķ��̼��� ���� ���� ����
        $dumpvars(0, tb_debug);

        // �׽�Ʈ ���̽� 1: A = 8'b00000000, B = 8'b00000000
        A = 8'b00000000;
        B = 8'b00000000;
        #10;

        // �׽�Ʈ ���̽� 2: A = 8'b00000001, B = 8'b00000001
        A = 8'b00000001;
        B = 8'b00000001;
        #10;

        // �׽�Ʈ ���̽� 3: A = 8'b00000010, B = 8'b00000010
        A = 8'b00000010;
        B = 8'b00000010;
        #10;

        // �׽�Ʈ ���̽� 4: A = 8'b00001111, B = 8'b00001111
        A = 8'b00001111;
        B = 8'b00001111;
        #10;

        // �׽�Ʈ ���̽� 5: A = 8'b11111111, B = 8'b11111111
        A = 8'b11111111;
        B = 8'b11111111;
        #10;

        // �پ��� ���� �׽�Ʈ �߰�
        A = $random;
        B = $random;
        #10;

        A = $random;
        B = $random;
        #10;

        A = $random;
        B = $random;
        #10;

        // �ùķ��̼� ����
        $finish;
    end

    // ��� ����͸�
    initial begin
        $monitor("Time = %0t | A = %b, B = %b | R1 = %b | R2 = %b | R3 = %b | R4 = %b",
                 $time, A, B, R1, R2, R3, R4);
    end

endmodule
