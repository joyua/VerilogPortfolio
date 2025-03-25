`timescale 1ns / 1ps

module tb_stage3;
    reg [10:0] A, B;
    wire [14:0] S, E;
    
    // Instantiate the DUT (Device Under Test)
    stage3 uut (
        .A(A),
        .B(B),
        .S(S),
        .E(E)
    );
    
    initial begin
        // Test Cases
        repeat (10) begin
            A = $random;
            B = $random;
            
            #10; // Wait for propagation
            
            // Display results
            $display("Time = %0t | A = %b | B = %b | S = %b | E = %b", $time, A, B, S, E);
        end
        
        // Finish simulation
        #10;
        $finish;
    end
    
endmodule
