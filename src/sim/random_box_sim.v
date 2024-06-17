`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 18:34:57
// Design Name: 
// Module Name: random_box_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for the random_box module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module random_box_sim;

    // Inputs
    reg clk;
    reg rst_n;
    reg drive;

    // Outputs
    wire [9:0] box_x;
    wire [9:0] box_y;

    // Instantiate the Unit Under Test (UUT)
    random_box uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .drive(drive), 
        .box_x(box_x), 
        .box_y(box_y)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        rst_n = 0;
        drive = 0;

        // Reset the system
        #10;
        rst_n = 1;

        // Apply test vectors
        #20;
        drive = 1; // Drive signal to generate new random coordinates

        #10;
        drive = 0; // Stop the drive signal

        // Monitor the outputs
        #100;
        $display("Box X: %d, Box Y: %d", box_x, box_y);

        // Apply another drive signal
        #50;
        drive = 1;

        #10;
        drive = 0;

        // Monitor the outputs again
        #100;
        $display("Box X: %d, Box Y: %d", box_x, box_y);

        // Finish the simulation
        #100;
        $finish;
    end

endmodule
