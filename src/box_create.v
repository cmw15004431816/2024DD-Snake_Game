`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 18:42:29
// Design Name: 
// Module Name: box_create
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
///////////////////////////////////////////////////////////////////////
module box_create(
    input clk,
    input rst_n,
    input [8:0] rand_num,
    input rand_drive,
    output reg [9:0] rand_x,
    output reg [9:0] rand_y
    );
    //-----------------------------------------------------------------------------
    reg flag;
    always @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            rand_x <= 9'd300;
            rand_y <= 9'd300;
            flag <= 1'b0;
        end else if (rand_drive) begin
            flag <= 1'b1;
            rand_x <= rand_num;
        end else if (flag == 1'b1) begin
            rand_y <= rand_num;
            flag <= 1'b0;
        end
endmodule
