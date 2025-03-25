`timescale 1ns / 1ps

module Stage1 (
    input [7:0] A,  // 8-bit Multiplicand
    input [7:0] B,  // 8-bit Multiplier
    output [63:0] pp
);
    wire [63:0] partial_products;
    // ? 부분곱 생성 (assign 사용)
    genvar k, j;
    generate
        for (k = 0; k < 8; k = k + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                assign partial_products[k * 8 + j] = A[k] & B[j];  
            end
        end
    endgenerate
    
    genvar i;
    generate
        for (i = 0; i < 64; i = i + 1) begin : zero_fill
            if (!( (i == 7) || (i == 6) || (i == 5) || (i == 4) || (i == 3) || (i == 2) || (i == 1) ||
                  (i == 22) || (i == 21) || (i == 20) || (i == 19) || (i == 18) || (i == 17) ||
                  (i == 37) || (i == 36) || (i == 35) || (i == 34) || (i == 33) ||
                  (i == 52) || (i == 51) || (i == 50) || (i == 49) )) begin
              assign pp[i] = partial_products[i];
          end
        end
    endgenerate


    // ? OR 연산 후 partial_products에 적용 (assign으로 수행)
    assign pp[7]  = partial_products[7]  | partial_products[14];
    assign pp[6]  = partial_products[6]  | partial_products[13];
    assign pp[5]  = partial_products[5]  | partial_products[12];
    assign pp[4]  = partial_products[4]  | partial_products[11];
    assign pp[3]  = partial_products[3]  | partial_products[10];
    assign pp[2]  = partial_products[2]  | partial_products[9];
    assign pp[1]  = partial_products[1]  | partial_products[8];

    assign pp[22] = partial_products[22] | partial_products[29];
    assign pp[21] = partial_products[21] | partial_products[28];
    assign pp[20] = partial_products[20] | partial_products[27];
    assign pp[19] = partial_products[19] | partial_products[26];
    assign pp[18] = partial_products[18] | partial_products[25];
    assign pp[17] = partial_products[17] | partial_products[24];

    assign pp[37] = partial_products[37] | partial_products[44];
    assign pp[36] = partial_products[36] | partial_products[43];
    assign pp[35] = partial_products[35] | partial_products[42];
    assign pp[34] = partial_products[34] | partial_products[41];
    assign pp[33] = partial_products[33] | partial_products[40];

    assign pp[52] = partial_products[52] | partial_products[59];
    assign pp[51] = partial_products[51] | partial_products[58];
    assign pp[50] = partial_products[50] | partial_products[57];
    assign pp[49] = partial_products[49] | partial_products[56];

endmodule
