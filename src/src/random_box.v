`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 18:34:57
// Design Name: 
// Module Name: n
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

module random_box(
    input clk,
    input rst_n,
    input drive,
    output wire [9:0] box_x,
    output wire [9:0] box_y
    );
    //---------------------------------------------------------------------------------
    
    wire [8:0] rand_num;
    random U1_random(
        .clk(clk),
        .rst_n(rst_n),
        .rand_num(rand_num)
    );
    
    wire [9:0] rand_x;
    wire [9:0] rand_y;
    box_create U1_box_create(
        .clk(clk),
        .rst_n(rst_n),
        .rand_num(rand_num),
        .rand_drive(drive),
        .rand_x(rand_x),
        .rand_y(rand_y)
    );
    assign box_x = rand_x;
    assign box_y = rand_y;
endmodule
