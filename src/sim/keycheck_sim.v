`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 18:45:37
// Design Name: 
// Module Name: keycheck_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Simulation for keycheck module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module keycheck_sim();

// Inputs
reg clk;
reg rst_n;
reg key;

// Outputs
wire key_v;

// Instantiate the Unit Under Test (UUT)
keycheck uut (
    .clk(clk),
    .rst_n(rst_n),
    .key(key),
    .key_v(key_v)
);

initial begin
    // Initialize Inputs
    clk = 0;
    rst_n = 0;
    key = 0;

    // Wait for 100 ns for global reset to finish
    #100;
    rst_n = 1;

    // Apply key press and release sequence
    #50 key = 1;   // Press key
    #50 key = 0;   // Release key
    #50 key = 1;   // Press key
    #50 key = 0;   // Release key

    // Run simulation for a specific time
    #500; // Run for 500 ns
    $finish;
end

always #5 clk = ~clk; // Generate a clock signal with a period of 10 ns (100 MHz)

endmodule
