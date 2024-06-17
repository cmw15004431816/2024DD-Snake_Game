`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2024 03:31:00 PM
// Design Name: 
// Module Name: random_sim
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


`timescale 1ns / 1ps

module random_sim();

// Inputs
reg clk;
reg rst_n;

// Outputs
wire [8:0] rand_num;

// Instantiate the Unit Under Test (UUT)
random uut (
    .clk(clk),
    .rst_n(rst_n),
    .rand_num(rand_num)
);

initial begin
    // Initialize Inputs
    clk = 0;
    rst_n = 0;

    // Wait for 100 ns for global reset to finish
    #100;
    rst_n = 1;

    // Run simulation for a specific time
    #20000; // Run for 20 us
    $finish;
end

always #10 clk = ~clk; // Generate a clock signal with a period of 20 ns (50 MHz)

endmodule
