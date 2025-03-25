`timescale 1ns / 1ps

module tb_result;
    reg [14:0] S;
    reg [3:0] E;
    wire [15:0] Z;
    wire [15:11] Carry; // Carry 신호 출력 추가
    
    // Instantiate the DUT (Device Under Test)
    result uut (
        .S(S),
        .E(E),
        .Z(Z)
    );
    
    initial begin
        // Random test cases
        repeat (10) begin
            S = $random;
            E = $random;
            
            #10; // Wait for propagation
            
            // Display results including Carry
            $display("Time = %0t | S = %b | E = %b | Z = %b | Carry[11-15] = %b", $time, S, E, Z, uut.Carry);
        end
        
        // Finish simulation
        #10;
        $finish;
    end
    
endmodule
