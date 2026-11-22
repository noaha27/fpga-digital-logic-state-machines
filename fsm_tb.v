`timescale 1ns/1ps

module fsm_tb;
    reg clk = 0;
    reg reset = 1;
    reg x = 0;
    wire mealy_y, moore_y;

    mealy_fsm uut1 (
        .clk(clk), .reset(reset),
        .x(x), .y(mealy_y)
    );

    moore_fsm uut2 (
        .clk(clk), .reset(reset),
        .x(x), .y(moore_y)
    );

    always #5 clk = ~clk;

    initial begin
        #12 reset = 0;

        // Sequence: 1 0 1 1 0 1
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;

        @(negedge clk) x = 0;
        #10 $finish;
    end
endmodule
