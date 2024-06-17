`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2024 02:56:10 PM
// Design Name: 
// Module Name: Bpmusic_sim
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

module Bpmusic_sim();

// Inputs
reg key;
reg clk;

// Outputs
wire beep;

// Instantiate the Unit Under Test (UUT)
Bpmusic uut (
    .key(key),
    .clk(clk),
    .beep(beep)
);

initial begin
    // Initialize Inputs
    key = 1;
    clk = 0;

    // Wait for 100 ns for global reset to finish
    #100;

    // Test case: Key press (active low)
    key = 0;
    #200000; // Wait for some time to observe the beep signal

    // Test case: Key release (inactive high)
    key = 1;
    #200000; // Wait for some time to observe the beep signal

    // Finish the simulation
    $finish;
end

always #5 clk = ~clk; // Generate a clock signal with a period of 10 ns

endmodule
