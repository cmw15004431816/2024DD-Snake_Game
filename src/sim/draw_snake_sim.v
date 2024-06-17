`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 18:43:24
// Design Name: 
// Module Name: draw_snake_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Simulation for draw_snake module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module draw_snake_sim();

// Inputs
reg clk;
reg rdn;
reg [8:0] row;
reg [9:0] col;
reg rst_n;
reg [9:0] box_x;
reg [8:0] box_y;
reg snake_r;
reg snake_head;

// Outputs
wire [11:0] pixel;

// Instantiate the Unit Under Test (UUT)
draw_snake uut (
    .clk(clk),
    .rdn(rdn),
    .row(row),
    .col(col),
    .rst_n(rst_n),
    .box_x(box_x),
    .box_y(box_y),
    .pixel(pixel),
    .snake_r(snake_r),
    .snake_head(snake_head)
);

initial begin
    // Initialize Inputs
    clk = 0;
    rdn = 1;
    row = 0;
    col = 0;
    rst_n = 0;
    box_x = 10'd300;
    box_y = 9'd300;
    snake_r = 0;
    snake_head = 0;

    // Wait for 100 ns for global reset to finish
    #100;
    rst_n = 1;

    // Apply test stimulus
    // Simulate the snake's head and body moving
    #50 col = 10'd290; row = 9'd290; rdn = 0; snake_head = 1; // Snake head position
    #50 col = 10'd295; row = 9'd295; snake_head = 0; snake_r = 1; // Snake body position
    #50 col = 10'd305; row = 9'd305; snake_r = 0; // Box position
    #50 col = 10'd310; row = 9'd310;
    #50 col = 10'd300; row = 9'd300;

    // Finish simulation
    #500; // Run for 500 ns
    $finish;
end

always #5 clk = ~clk; // Generate a clock signal with a period of 10 ns (100 MHz)

endmodule
