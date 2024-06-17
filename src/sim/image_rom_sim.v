`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/15 22:37:23
// Design Name: 
// Module Name: image_rom_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Simulation for image_rom module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module image_rom_sim();

// Inputs
reg [18:0] addr;

// Outputs
wire [11:0] data;

// Instantiate the Unit Under Test (UUT)
image_rom uut (
    .addr(addr),
    .data(data)
);

initial begin
    // Initialize Inputs
    addr = 0;

    // Wait for 100 ns for global reset to finish
    #100;
    
    // Apply test stimulus
    addr = 19'd0;
    #10 addr = 19'd1;
    #10 addr = 19'd2;
    #10 addr = 19'd3;
    #10 addr = 19'd640; // Jump to a new row
    #10 addr = 19'd1000;
    #10 addr = 19'd307199; // Last address in memory

    // Run simulation for a specific time
    #100; // Run for an additional 100 ns
    $finish;
end

endmodule
