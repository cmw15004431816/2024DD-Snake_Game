`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 18:42:03
// Design Name: 
// Module Name: random
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
///////////////////////////////////////////////////////////////////////////
module random(
    input clk,
    input rst_n,
    output reg [8:0] rand_num
    );
    //-----------------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n)
        if (!rst_n) rand_num <= 9'd132;
        else begin
            rand_num[0] <= rand_num[8];
            rand_num[1] <= rand_num[0];
            rand_num[2] <= rand_num[1];
            rand_num[3] <= rand_num[2];
            rand_num[4] <= rand_num[3] ^ rand_num[8];
            rand_num[5] <= rand_num[4] ^ rand_num[8];
            rand_num[6] <= rand_num[5] ^ rand_num[8];
            rand_num[7] <= rand_num[6];
            rand_num[8] <= rand_num[7];
            if (rand_num > 9'd240)
                rand_num <= rand_num % 9'd240;
        end
endmodule
