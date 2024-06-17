`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/14 18:45:37
// Design Name: 
// Module Name: keycheck
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


module keycheck(
    input clk,
    input rst_n,
    input key,
    output reg key_v
);

    reg [2:0] key_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            key_cnt <= 3'b000;
        else
            key_cnt <= {key_cnt[1:0], key};
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            key_v <= 1'b0;
        else if (key_cnt == 3'b110)
            key_v <= 1'b1;
        else
            key_v <= 1'b0;
    end

endmodule
