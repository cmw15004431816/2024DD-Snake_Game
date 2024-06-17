`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2024 11:55:50 AM
// Design Name: 
// Module Name: draw_cover_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for the draw_cover module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module draw_cover_sim;

    // Inputs
    reg clk;
    reg rst;
    reg fin;

    // Outputs
    wire [3:0] R;
    wire [3:0] G;
    wire [3:0] B;
    wire HS;
    wire VS;

    // Instantiate the Unit Under Test (UUT)
    draw_cover uut (
        .clk(clk),
        .rst(rst),
        .fin(fin),
        .R(R),
        .G(G),
        .B(B),
        .HS(HS),
        .VS(VS)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #20 clk = ~clk; // 25 MHz clock
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 1;
        fin = 0;

        // Apply reset
        #100;
        rst = 0;

        // Monitor the outputs
        #1000;
        $display("R: %d, G: %d, B: %d, HS: %b, VS: %b", R, G, B, HS, VS);

        // Simulate some conditions
        #100;
        fin = 1;
        
        // Monitor the outputs again
        #1000;
        $display("R: %d, G: %d, B: %d, HS: %b, VS: %b", R, G, B, HS, VS);

        // Finish the simulation
        #2000;
        $finish;
    end

endmodule
