`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 18:43:24
// Design Name: 
// Module Name: draw
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
//////////////////////////////////////////////////////////////////////////////////


module draw_snake(
    input clk,
    input rdn,
    input [8:0] row,
    input [9:0] col,
    input rst_n,
    input [9:0] box_x,
    input [8:0] box_y,
    output reg [11:0] pixel,
    input snake_r,
    input snake_head
    );
    parameter RED = 12'b0000_0000_1111;
    parameter GREEN = 12'b0000_1111_0000;
    parameter BLUE = 12'b1111_0000_0000;
    parameter YELLOW = 12'b0000_1111_1111;

    always @(posedge clk ) begin
        if (rst_n==0) pixel <= YELLOW;
        else if (!rdn) begin 
        if(snake_head) pixel<=YELLOW;
          else  if (snake_r) pixel <= GREEN; 
            else if (col >= box_x-10'd10 &&col<=box_x+10'd10 && row>=box_y-10'd10&& row<=box_y+10'd10) pixel <= RED; 
            else pixel <= 12'h000; 
        end
    end
endmodule
