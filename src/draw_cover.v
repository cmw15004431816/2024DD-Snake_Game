`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2024 11:55:50 AM
// Design Name: 
// Module Name: draw_cover
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


module draw_cover (
    input wire clk,         // System clock, 25 MHz for VGA
    input wire rst, 
    input wire fin,       // Reset signal
    output wire [3:0] R,    // Red color signal
    output wire [3:0] G,    // Green color signal
    output wire [3:0] B,    // Blue color signal
    output wire HS,         // Horizontal sync signal
    output wire VS          // Vertical sync signal
);
 
    wire [8:0] row;
    wire [9:0] col;
    wire rdn;
    wire [11:0] Din;
    wire [18:0] pixel_addr;   // Control signal to switch between image and snake
    // Instantiate the VGA controller
    VGA vga_inst (
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

    // Instantiate the ROM with image data
    image_rom rom_inst (
        .addr(pixel_addr),
        .data(Din)
    );
  

    // Instantiate the draw_snake module
    /*
    draw_snake snake_inst (
        .clk(clk),
        .rdn(rdn),
        .row(row),
        .col(col),
        .rst_n(~rst),
        .box_x(10'd320),      // Example box_x position, update as needed
        .box_y(9'd240),       // Example box_y position, update as needed
        .pixel(snake_pixel),
        .snake_r(1'b0),       // Example signal, update as needed
        .snake_head(1'b0)     // Example signal, update as needed
    );
    */

    // Calculate the address for the ROM
    assign pixel_addr = row * 640 + col;

    // Control signal logic
    /*
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            control_signal <= 1'b0; // Reset state
        end else begin
            // Define your condition to switch between image and snake display
            // For example, switch to draw_snake when a certain condition is met
            control_signal <= ( your condition here );
        end
    end
*/
    // Select final pixel data based on control signal
    //assign final_pixel = control_signal ? snake_pixel : Din;

endmodule

