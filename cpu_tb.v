`timescale 1ns / 1ps
module cpu_tb;
    reg clk, reset;

    cpu uut (.clk(clk), .reset(reset));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10 reset = 0;
        #100;
        $finish;
    end

    initial begin
        $monitor("Time=%t | PC=%h | IR=%h | RegFile=%h",
                 $time, uut.pc, uut.ir, uut.regfile);
    end
endmodule