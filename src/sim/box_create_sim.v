`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2024 03:41:52 PM
// Design Name: 
// Module Name: box_create_sim
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

module box_create_sim();

// Inputs
reg clk;
reg rst_n;
reg [8:0] rand_num;
reg rand_drive;

// Outputs
wire [9:0] rand_x;
wire [9:0] rand_y;

// Instantiate the Unit Under Test (UUT)
box_create uut (
    .clk(clk),
    .rst_n(rst_n),
    .rand_num(rand_num),
    .rand_drive(rand_drive),
    .rand_x(rand_x),
    .rand_y(rand_y)
);

initial begin
    // Initialize Inputs
    clk = 0;
    rst_n = 0;
    rand_num = 9'd0;
    rand_drive = 0;

    // Wait for 100 ns for global reset to finish
    #100;
    rst_n = 1;

    // Drive random number and rand_drive signals
    #50 rand_num = 9'd123; rand_drive = 1;
    #50 rand_drive = 0;
    #50 rand_num = 9'd456; rand_drive = 1;
    #50 rand_drive = 0;
    #50 rand_num = 9'd789; rand_drive = 1;
    #50 rand_drive = 0;

    // Run simulation for a specific time
    #1000; // Run for 1 us
    $finish;
end

always #10 clk = ~clk; // Generate a clock signal with a period of 20 ns (50 MHz)

endmodule

