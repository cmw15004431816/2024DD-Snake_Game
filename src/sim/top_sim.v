`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 18:37:42
// Design Name: 
// Module Name: snack_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for the snack module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_sim;

    // Inputs
    reg ps2_data;
    reg ps2_clk;
    reg clk;
    reg [1:0] speed_mode;
    reg rst_n;
    reg key;

    // Outputs
    wire hsync;
    wire vsync;
    wire beep;
    wire [3:0] vga_r;
    wire [3:0] vga_g;
    wire [3:0] vga_b;

    // Instantiate the Unit Under Test (UUT)
    snack uut (
        .ps2_data(ps2_data),
        .ps2_clk(ps2_clk),
        .clk(clk),
        .speed_mode(speed_mode),
        .rst_n(rst_n),
        .key(key),
        .hsync(hsync),
        .vsync(vsync),
        .beep(beep),
        .vga_r(vga_r),
        .vga_g(vga_g),
        .vga_b(vga_b)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #20 clk = ~clk; // 25 MHz clock
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        ps2_data = 0;
        ps2_clk = 0;
        speed_mode = 2'b00;
        rst_n = 0;
        key = 0;

        // Apply reset
        #100;
        rst_n = 1;

        // Monitor the outputs
        #1000;
        $display("VGA R: %d, VGA G: %d, VGA B: %d, HSYNC: %b, VSYNC: %b, BEEP: %b", vga_r, vga_g, vga_b, hsync, vsync, beep);

        // Simulate some conditions
        #100;
        speed_mode = 2'b01;
        key = 1;

        // Monitor the outputs again
        #1000;
        $display("VGA R: %d, VGA G: %d, VGA B: %d, HSYNC: %b, VSYNC: %b, BEEP: %b", vga_r, vga_g, vga_b, hsync, vsync, beep);

        // Simulate PS/2 input
        ps2_clk = 1;
        ps2_data = 1;
        #200;
        ps2_clk = 0;
        ps2_data = 0;

        // Monitor the outputs again
        #1000;
        $display("VGA R: %d, VGA G: %d, VGA B: %d, HSYNC: %b, VSYNC: %b, BEEP: %b", vga_r, vga_g, vga_b, hsync, vsync, beep);

        // Finish the simulation
        #2000;
        $finish;
    end

endmodule
