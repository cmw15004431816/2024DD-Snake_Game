`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/15 18:36:43
// Design Name: 
// Module Name: snack_control_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for snack_control module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module snake_control_sim();

    // Inputs
    reg clk;
    reg rst_n;
    reg key_r;
    reg key_l;
    reg key_u;
    reg key_d;
    reg [9:0] box_x;
    reg [8:0] box_y;
    reg [9:0] x_pos;
    reg [8:0] y_pos;
    reg [1:0] speed_mode;

    // Outputs
    wire drive;
    wire snack_r;
    wire snake_head;

    // Instantiate the Unit Under Test (UUT)
    snack_control uut (
        .clk(clk),
        .rst_n(rst_n),
        .key_r(key_r),
        .key_l(key_l),
        .key_u(key_u),
        .key_d(key_d),
        .box_x(box_x),
        .box_y(box_y),
        .x_pos(x_pos),
        .y_pos(y_pos),
        .speed_mode(speed_mode),
        .drive(drive),
        .snack_r(snack_r),
        .snake_head(snake_head)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;
        key_r = 0;
        key_l = 0;
        key_u = 0;
        key_d = 0;
        box_x = 10'd300;
        box_y = 9'd200;
        x_pos = 10'd400;
        y_pos = 9'd300;
        speed_mode = 2'b01; // Normal speed

        // Wait for 100 ns for global reset to finish
        #100;
        rst_n = 1; // Release reset

        // Apply test stimulus
        #50 key_r = 1; // Move right
        #10 key_r = 0;
        #500000; // Wait for some time

        #50 key_d = 1; // Move down
        #10 key_d = 0;
        #500000; // Wait for some time

        #50 key_l = 1; // Move left
        #10 key_l = 0;
        #500000; // Wait for some time

        #50 key_u = 1; // Move up
        #10 key_u = 0;
        #500000; // Wait for some time

        // Change speed mode
        #50 speed_mode = 2'b10; // Fast speed
        #1000000; // Wait for some time

        #50 speed_mode = 2'b00; // Slow speed
        #1000000; // Wait for some time

        // Finish simulation
        #1000;
        $finish;
    end

endmodule
