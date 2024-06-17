`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2024 03:12:52 PM
// Design Name: 
// Module Name: VGA_sim
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

module VGA_sim();

// Inputs
reg clk;
reg rst;
reg [11:0] Din;

// Outputs
wire [8:0] row;
wire [9:0] col;
wire rdn;
wire [3:0] R, G, B;
wire HS, VS;

// Instantiate the Unit Under Test (UUT)
VGA uut (
    .clk(clk),
    .rst(rst),
    .Din(Din),
    .row(row),
    .col(col),
    .rdn(rdn),
    .R(R),
    .G(G),
    .B(B),
    .HS(HS),
    .VS(VS)
);

initial begin
    // Initialize Inputs
    clk = 0;
    rst = 1;
    Din = 12'h0F0; // Example input color (green)

    // Wait for 100 ns for global reset to finish
    #100;
    rst = 0;

    // Run simulation for a specific time
    #2000000; // Run for 2 ms
    $finish;
end

always #20 clk = ~clk; // Generate a clock signal with a period of 40 ns (25 MHz)

endmodule
