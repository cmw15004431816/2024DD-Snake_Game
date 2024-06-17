`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 18:36:43
// Design Name: 
// Module Name: jh
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


module snack_control(
    input clk,
    input rst_n,
    input key_r,
    input key_l,
    input key_u,
    input key_d,
    input [9:0] box_x,
    input [8:0] box_y,
    input [9:0] x_pos,
    input [8:0] y_pos,
    input [1:0] speed_mode,
    output reg drive,
    output  snack_r,
    output snake_head
    );
    //------------------------------------------------------------------------------
    wire key_r1;
    wire key_l1;
    wire key_u1;
    wire key_d1;
    reg [1:0] dir; 
    parameter right = 2'd0;
    parameter left = 2'd1;
    parameter up = 2'd2;
    parameter down = 2'd3;
    keycheck r_keycheck(
        .clk(clk),
        .rst_n(rst_n),
        .key(key_r),
        .key_v(key_r1)
    );
    keycheck l_keycheck(
        .clk(clk),
        .rst_n(rst_n),
        .key(key_l),
        .key_v(key_l1)
    );
    keycheck u_keycheck(
        .clk(clk),
        .rst_n(rst_n),
        .key(key_u),
        .key_v(key_u1)
    );
    keycheck d_keycheck(
        .clk(clk),
        .rst_n(rst_n),
        .key(key_d),
        .key_v(key_d1)
    );
    always @(posedge clk or negedge rst_n)
        if (!rst_n) dir <= right;
        else if (key_r1 && dir != left) dir <= right;
        else if (key_l1 && dir != right) dir <= left;
        else if (key_u1 && dir != down) dir <= up;
        else if (key_d1 && dir != up) dir <= down;
    //------------------------------------------------------------------------------
    
    reg [9:0] snack_x[19:0];
    reg [8:0] snack_y[19:0];
    reg [20:0] cnt_m; 
    
    reg [20:0]update_time;
    always @( posedge clk or negedge rst_n) begin
    if(!rst_n)
        update_time = 19'd420000;
      else begin
         case (speed_mode)
         2'b00: update_time <= 20'd620000; // Slowest speed mode
         2'b01: update_time <= 20'd420000; // Slow speed mode
         2'b10: update_time <= 20'd320000; // Normal speed mode
         endcase
        end
    end

    
   
     reg fin;

   // parameter update_time = 19'd420000;
    
    always @(posedge clk or negedge rst_n)
        if (!rst_n) cnt_m <= 19'd0;
        else if (fin) cnt_m <= 19'd0;
        else if (cnt_m == update_time) cnt_m <= 19'd0;
        else cnt_m <= cnt_m + 19'd1;
    
    always @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            snack_x[0] <= 10'd400;
            snack_y[0] <= 10'd300;
        end else if (cnt_m == update_time)
            case (dir)
                right: if (snack_x[0] >= 10'd799) snack_x[0] <= 10'd0;
                       else snack_x[0] <= snack_x[0] + 10'd5;
                left: if (snack_x[0] == 10'd0) snack_x[0] <= 10'd799;
                      else snack_x[0] <= snack_x[0] - 10'd5;
                up: if (snack_y[0] >= 10'd599) snack_y[0] <= 10'd0;
                    else snack_y[0] <= snack_y[0] + 10'd5;
                down: if (snack_y[0] == 10'd0) snack_y[0] <= 10'd599;
                      else snack_y[0] <= snack_y[0] - 10'd5;
            endcase
    
    always @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            snack_x[1] <= 10'd0;
            snack_y[1] <= 10'd0;
            snack_x[2] <= 10'd0;
            snack_y[2] <= 10'd0;
            snack_x[3] <= 10'd0;
            snack_y[3] <= 10'd0;
            snack_x[4] <= 10'd0;
            snack_y[4] <= 10'd0;
            snack_x[5] <= 10'd0;
            snack_y[5] <= 10'd0;
            snack_x[6] <= 10'd0;
            snack_y[6] <= 10'd0;
            snack_x[7] <= 10'd0;
            snack_y[7] <= 10'd0;
            snack_x[8] <= 10'd0;
            snack_y[8] <= 10'd0;
            snack_x[9] <= 10'd0;
            snack_y[9] <= 10'd0;
            snack_x[10] <= 10'd0;
            snack_y[10] <= 10'd0;
            snack_x[11] <= 10'd0;
            snack_y[11] <= 10'd0;
            snack_x[12] <= 10'd0;
            snack_y[12] <= 10'd0;
            snack_x[13] <= 10'd0;
            snack_y[13] <= 10'd0;
            snack_x[14] <= 10'd0;
            snack_y[14] <= 10'd0;
            snack_x[15] <= 10'd0;
            snack_y[15] <= 10'd0;
            snack_x[16] <= 10'd0;
            snack_y[16] <= 10'd0;
            snack_x[17] <= 10'd0;
            snack_y[17] <= 10'd0;
            snack_x[18] <= 10'd0;
            snack_y[18] <= 10'd0;
            snack_x[19] <= 10'd0;
            snack_y[19] <= 10'd0;
        end else if (cnt_m == update_time) begin
            snack_x[1] <= snack_x[0];
            snack_y[1] <= snack_y[0];
            snack_x[2] <= snack_x[1];
            snack_y[2] <= snack_y[1];
            snack_x[3] <= snack_x[2];
            snack_y[3] <= snack_y[2];
            snack_x[4] <= snack_x[3];
            snack_y[4] <= snack_y[3];
            snack_x[5] <= snack_x[4];
            snack_y[5] <= snack_y[4];
            snack_x[6] <= snack_x[5];
            snack_y[6] <= snack_y[5];
            snack_x[7] <= snack_x[6];
            snack_y[7] <= snack_y[6];
            snack_x[8] <= snack_x[7];
            snack_y[8] <= snack_y[7];
            snack_x[9] <= snack_x[8];
            snack_y[9] <= snack_y[8];
            snack_x[10] <= snack_x[9];
            snack_y[10] <= snack_y[9];
            snack_x[11] <= snack_x[10];
            snack_y[11] <= snack_y[10];
            snack_x[12] <= snack_x[11];
            snack_y[12] <= snack_y[11];
            snack_x[13] <= snack_x[12];
            snack_y[13] <= snack_y[12];
            snack_x[14] <= snack_x[13];
            snack_y[14] <= snack_y[13];
            snack_x[15] <= snack_x[14];
            snack_y[15] <= snack_y[14];
            snack_x[16] <= snack_x[15];
            snack_y[16] <= snack_y[15];
            snack_x[17] <= snack_x[16];
            snack_y[17] <= snack_y[16];
            snack_x[18] <= snack_x[17];
            snack_y[18] <= snack_y[17];
            snack_x[19] <= snack_x[18];
            snack_y[19] <= snack_y[18];
            
        end
    //------------------------------------------------------------------------------
    
    reg [4:0] length;
    always @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            length <= 5'd1;
            drive <= 1'd0;
        end else if (drive) drive <= 1'd0;
        else if (snack_x[0] >= box_x-10'd10&&snack_x[0]<=box_x+10'd10 && snack_y[0] >= box_y-10'd10&&snack_y[0]<=box_y+10'd10) begin
            drive <= 1'd1;
            if (length < 5'd20) length <= length + 5'd1;
            else length <= length;
        end
    //-------------------------------------------------------------------------------
   
    always @(posedge clk or negedge rst_n)
        if (!rst_n) fin <= 1'b0;
        else if ((snack_x[0] == snack_x[1] && snack_y[0] == snack_y[1]) ||
                 (snack_x[0] == snack_x[2] && snack_y[0] == snack_y[2]) ||
                 (snack_x[0] == snack_x[3] && snack_y[0] == snack_y[3]) ||
                 (snack_x[0] == snack_x[4] && snack_y[0] == snack_y[4]) ||
                 (snack_x[0] == snack_x[5] && snack_y[0] == snack_y[5]) ||
                 (snack_x[0] == snack_x[6] && snack_y[0] == snack_y[6]) ||
                 (snack_x[0] == snack_x[7] && snack_y[0] == snack_y[7]) ||
                 (snack_x[0] == snack_x[8] && snack_y[0] == snack_y[8]) ||
                 (snack_x[0] == snack_x[9] && snack_y[0] == snack_y[9]) ||
                 (snack_x[0] == snack_x[10] && snack_y[0] == snack_y[10]) ||
                 (snack_x[0] == snack_x[11] && snack_y[0] == snack_y[11]) ||
                 (snack_x[0] == snack_x[12] && snack_y[0] == snack_y[12]) ||
                 (snack_x[0] == snack_x[13] && snack_y[0] == snack_y[13]) ||
                 (snack_x[0] == snack_x[14] && snack_y[0] == snack_y[14]) ||
                 (snack_x[0] == snack_x[15] && snack_y[0] == snack_y[15]) ||
                 (snack_x[0] == snack_x[16] && snack_y[0] == snack_y[16]) ||
                 (snack_x[0] == snack_x[17] && snack_y[0] == snack_y[17]) ||
                 (snack_x[0] == snack_x[18] && snack_y[0] == snack_y[18]) ||
                 (snack_x[0] == snack_x[19] && snack_y[0] == snack_y[19] )) fin <= 1'b1;
                 
     
    //-------------------------------------------------------------------------------
    
   /* assign snack_r = (x_pos == snack_x[0] && y_pos == snack_y[0]) ||
                     (x_pos == snack_x[1] && y_pos == snack_y[1] && length > 4'd1) ||
                     (x_pos == snack_x[2] && y_pos == snack_y[2] && length > 4'd2) ||
                     (x_pos == snack_x[3] && y_pos == snack_y[3] && length > 4'd3) ||
                     (x_pos == snack_x[4] && y_pos == snack_y[4] && length > 4'd4) ||
                     (x_pos == snack_x[5] && y_pos == snack_y[5] && length > 4'd5) ||
                     (x_pos == snack_x[6] && y_pos == snack_y[6] && length > 4'd6) ||
                     (x_pos == snack_x[7] && y_pos == snack_y[7] && length > 4'd7) ||
                     (x_pos == snack_x[8] && y_pos == snack_y[8] && length > 4'd8) ||
                     (x_pos == snack_x[9] && y_pos == snack_y[9] && length > 4'd9) ||
                     (x_pos == snack_x[10] && y_pos == snack_y[10] && length > 4'd10) ||
                     (x_pos == snack_x[11] && y_pos == snack_y[11] && length > 4'd11);*/
                      assign snack_r = (
                (x_pos >= snack_x[1]-10'd10 && x_pos <= snack_x[1]+10'd10)&&(y_pos >= snack_y[1]-10'd10 && y_pos <= snack_y[1]+10'd10)&&length > 5'd1)||
                ((x_pos >= snack_x[2]-10'd10 && x_pos <= snack_x[2]+10'd10)&&(y_pos >= snack_y[2]-10'd10 && y_pos <= snack_y[2]+10'd10)&&length > 5'd2)||
                ((x_pos >= snack_x[3]-10'd10 && x_pos <= snack_x[3]+10'd10)&&(y_pos >= snack_y[3]-10'd10 && y_pos <= snack_y[3]+10'd10)&&length > 5'd3)||
                ((x_pos >= snack_x[4]-10'd10 && x_pos <= snack_x[4]+10'd10)&&(y_pos >= snack_y[4]-10'd10 && y_pos <= snack_y[4]+10'd10)&&length > 5'd4)||
                ((x_pos >= snack_x[5]-10'd10 && x_pos <= snack_x[5]+10'd10)&&(y_pos >= snack_y[5]-10'd10 && y_pos <= snack_y[5]+10'd10)&&length > 5'd5)||
                ((x_pos >= snack_x[6]-10'd10 && x_pos <= snack_x[6]+10'd10)&&(y_pos >= snack_y[6]-10'd10 && y_pos <= snack_y[6]+10'd10)&&length > 5'd6)||
                ((x_pos >= snack_x[7]-10'd10 && x_pos <= snack_x[7]+10'd10)&&(y_pos >= snack_y[7]-10'd10 && y_pos <= snack_y[7]+10'd10)&&length > 5'd7)||
                ((x_pos >= snack_x[8]-10'd10 && x_pos <= snack_x[8]+10'd10)&&(y_pos >= snack_y[8]-10'd10 && y_pos <= snack_y[8]+10'd10)&&length > 5'd8)||
                ((x_pos >= snack_x[9]-10'd10 && x_pos <= snack_x[9]+10'd10)&&(y_pos >= snack_y[9]-10'd10 && y_pos <= snack_y[9]+10'd10)&&length > 5'd9)||
                ((x_pos >= snack_x[10]-10'd10 && x_pos <= snack_x[10]+10'd10)&&(y_pos >= snack_y[10]-10'd10 && y_pos <= snack_y[10]+10'd10)&&length > 5'd10)||
                ((x_pos >= snack_x[11]-10'd10 && x_pos <= snack_x[11]+10'd10)&&(y_pos >= snack_y[11]-10'd10 && y_pos <= snack_y[11]+10'd10)&&length > 5'd11)||
                ((x_pos >= snack_x[12]-10'd10 && x_pos <= snack_x[12]+10'd10)&&(y_pos >= snack_y[12]-10'd10 && y_pos <= snack_y[12]+10'd10)&&length > 5'd12)||
                ((x_pos >= snack_x[13]-10'd10 && x_pos <= snack_x[13]+10'd10)&&(y_pos >= snack_y[13]-10'd10 && y_pos <= snack_y[13]+10'd10)&&length > 5'd13)||
                ((x_pos >= snack_x[14]-10'd10 && x_pos <= snack_x[14]+10'd10)&&(y_pos >= snack_y[14]-10'd10 && y_pos <= snack_y[14]+10'd10)&&length > 5'd14)||
                ((x_pos >= snack_x[15]-10'd10 && x_pos <= snack_x[15]+10'd10)&&(y_pos >= snack_y[15]-10'd10 && y_pos <= snack_y[15]+10'd10)&&length > 5'd15)||
                ((x_pos >= snack_x[16]-10'd10 && x_pos <= snack_x[16]+10'd10)&&(y_pos >= snack_y[16]-10'd10 && y_pos <= snack_y[16]+10'd10)&&length > 5'd16)||
                ((x_pos >= snack_x[17]-10'd10 && x_pos <= snack_x[17]+10'd10)&&(y_pos >= snack_y[17]-10'd10 && y_pos <= snack_y[17]+10'd10)&&length > 5'd17)||
                ((x_pos >= snack_x[18]-10'd10 && x_pos <= snack_x[18]+10'd10)&&(y_pos >= snack_y[18]-10'd10 && y_pos <= snack_y[18]+10'd10)&&length > 5'd18)||
                ((x_pos >= snack_x[19]-10'd10 && x_pos <= snack_x[19]+10'd10)&&(y_pos >= snack_y[19]-10'd10 && y_pos <= snack_y[19]+10'd10)&&length > 5'd19);
                 
                  assign snake_head=((x_pos >= snack_x[0]-10'd10 && x_pos <= snack_x[0]+10'd10)&&(y_pos >= snack_y[0]-10'd10 && y_pos <= snack_y[0]+10'd10));
endmodule
