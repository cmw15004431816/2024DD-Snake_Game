`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/15 22:37:23
// Design Name: 
// Module Name: image_room
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


module image_rom (
    input wire [18:0] addr,  // Address input (suitable for 640x480 resolution)
    output reg [11:0] data   // 12-bit color output (4 bits each for R, G, B)
    
);

    reg [11:0] rom[0:307199]; // Memory for 640*480 pixels

    initial begin
        $readmemh("Start_1_data.hex", rom);
    end

    always @(addr) begin
        data = rom[addr];
    end

endmodule
