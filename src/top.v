`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 18:37:42
// Design Name: 
// Module Name: dsad
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


module snack(
    input ps2_data,
    input ps2_clk,
    input clk,
    input [1:0] speed_mode,
    input rst_n,
    input key,
    output hsync,
    output vsync,
    output beep,
    output [3:0] vga_r,
    output [3:0] vga_g,
    output [3:0] vga_b
    );
    reg [1:0] clkdiv;
    initial clkdiv = 2'b0;

    always @(posedge clk) 
        clkdiv <= clkdiv + 2'b1;
    //--------------------------------------------------------------------------------
    wire key_r,key_l,key_u,key_d;
    PS2 ps2(.clk(clkdiv[1]),.rst(!rst_n),.ps2_clk(ps2_clk),.ps2_data(ps2_data),.up(key_u),.left(key_l),.right(key_r),.down(key_d));
    wire [9:0] col;
    wire [8:0] row;
    wire [9:0] box_x;
    wire [8:0] box_y;
    //--------------------------------------------------------------------------------
    wire drive;
    wire snake_r;
    wire snake_head;
    snack_control u1_snack_control(
        .clk(clkdiv[1]),
        .rst_n(rst_n),
        .key_r(key_r),
        .key_l(key_l),
        .key_u(key_u),
        .key_d(key_d),
        .box_x(box_x),
        .box_y(box_y),
        .x_pos(col),
        .y_pos(row),
        .speed_mode(speed_mode),
        .drive(drive),
        .snack_r(snake_r),
        .snake_head(snake_head)
                  );
    //--------------------------------------------------------------------------------
    random_box u1_random_box(
        .clk(clkdiv[1]),
        .rst_n(rst_n),
        .drive(drive), 
        .box_x(box_x), 
        .box_y(box_y)
    );
    //-------------------------------------------------------------------------------- 
    wire [11:0] pixel;
    wire rdn;
    reg control_signal;
    wire [3:0]vga_r1;
    wire [3:0]vga_g1;
    wire [3:0]vga_b1;
    wire hsync1;
    wire vsync1;
    wire [3:0]vga_r2;
    wire [3:0]vga_g2;
    wire [3:0]vga_b2;
    wire hsync2;
    wire vsync2;
    VGA vga0(
        .clk(clkdiv[1]),
        .rst(!rst_n),
        .R(vga_r1),
        .G(vga_g1),
        .B(vga_b1),
        .HS(hsync1),
        .VS(vsync1),
        .row(row),
        .col(col),
        .rdn(rdn),
        .Din(pixel)
    );
   draw_cover cover(.clk(clkdiv[1]),.rst(rst_n),.R(vga_r2),.G(vga_g2),.B(vga_b2),.HS(hsync2),.VS(vsync2));
    draw_snake draw(
        .clk(clkdiv[1]),
        .rdn(rdn),
        .row(row),
        .col(col),
        .rst_n(rst_n),
        .box_x(box_x),
        .box_y(box_y),
        .pixel(pixel),
        .snake_r(snake_r),
        .snake_head(snake_head)
    );
    assign pixel_addr = row * 640 + col;

    // Control signal logic
    always @(posedge clkdiv[1] or negedge rst_n) begin
        if (!rst_n) begin
            control_signal <= 1'b0; // Reset state
        end else begin
            // Define your condition to switch between image and snake display
            // For example, switch to draw_snake when a certain condition is met
            control_signal <=1'b1;
        end
    end

    // Select final pixel data based on control signal
    
    assign vga_r = control_signal ? vga_r1 : vga_r2;
    assign vga_g = control_signal ? vga_g1 : vga_g2;
    assign vga_b = control_signal ? vga_b1 : vga_b2;
    assign hsync = control_signal ? hsync1 : hsync2;
    assign vsync = control_signal ? vsync1 : vsync2;
    Bpmusic music (
    .clk(clkdiv[1]),
    .key(key),
    .beep(beep)
    
    );
    
endmodule
