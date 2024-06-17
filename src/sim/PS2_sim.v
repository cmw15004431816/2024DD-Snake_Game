`timescale 1ns / 1ps

module PS2_sim();

// Inputs
reg clk;
reg rst;
reg ps2_clk;
reg ps2_data;

// Outputs
wire up;
wire left;
wire right;
wire down;

// Instantiate the Unit Under Test (UUT)
PS2 uut (
    .clk(clk),
    .rst(rst),
    .ps2_clk(ps2_clk),
    .ps2_data(ps2_data),
    .up(up),
    .left(left),
    .right(right),
    .down(down)
);

initial begin
    // Initialize Inputs
    clk = 0;
    rst = 1;
    ps2_clk = 1;
    ps2_data = 1;

    // Wait for 100 ns for global reset to finish
    #100;
    rst = 0;

    // Simulate pressing and releasing each direction key
    // up key
    simulate_key(8'hE0, 8'h75); // press
    simulate_key(8'hF0, 8'h75); // release

    // down key
    simulate_key(8'hE0, 8'h72); // press
    simulate_key(8'hF0, 8'h72); // release

    // left key
    simulate_key(8'hE0, 8'h6B); // press
    simulate_key(8'hF0, 8'h6B); // release

    // right key
    simulate_key(8'hE0, 8'h74); // press
    simulate_key(8'hF0, 8'h74); // release

    // Wait some time to observe the outputs
    #1000;

    $finish;
end

always #5 clk = ~clk; // Generate a clock signal with a period of 10 ns

task simulate_key;
    input [7:0] prefix;
    input [7:0] keycode;
    begin
        // Send prefix byte (if any)
        if (prefix != 8'h00) begin
            send_ps2_code(prefix);
        end
        // Send keycode byte
        send_ps2_code(keycode);
    end
endtask

task send_ps2_code;
    input [7:0] code;
    integer i;
    begin
        // Start bit (0)
        ps2_data = 0;
        #5000; ps2_clk = 0; #5000; ps2_clk = 1; #5000;

        // 8 data bits (LSB first)
        for (i = 0; i < 8; i = i + 1) begin
            ps2_data = code[i];
            #5000; ps2_clk = 0; #5000; ps2_clk = 1; #5000;
        end

        // Parity bit (odd parity)
        ps2_data = ~^code;
        #5000; ps2_clk = 0; #5000; ps2_clk = 1; #5000;

        // Stop bit (1)
        ps2_data = 1;
        #5000; ps2_clk = 0; #5000; ps2_clk = 1; #5000;
    end
endtask

endmodule
