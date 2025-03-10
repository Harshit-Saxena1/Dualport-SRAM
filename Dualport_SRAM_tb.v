`timescale 1ns/1ps
`include "Dualport_SRAM.v"

module Dualport_SRAM_tb;
reg clk;
reg cs;
reg write;
reg read;
reg [7:0]address;
reg [3:0]data_in;

wire [3:0]data_out;

Dualport_SRAM uut(clk, cs, write, read, address, data_in, data_out);
    
    initial begin
        $dumpfile("Dualport_SRAM_tb.vcd");
        $dumpvars(0,Dualport_SRAM_tb);
        clk = 0;
        cs = 0;
        write = 0;
        read = 0;
        address = 0;
        data_in = 0;
        #100;
        cs =1;
        write = 1;
        read = 0;
        data_in = 4'b0001;
        address = 4'b0001;
        #10;
        data_in = 4'b0010;
        address = 4'b0010;
        #10;
        read =1;
        write = 0;
        address = 4'b0001;
        #10;
        address = 4'b0010;
        #150;
        $finish;

    end
    always #5 clk = ~(clk);
    initial begin
    $display("Simulation starts");
    // $monitor("Time = %4d  In = %b  LR = %b  n = %b  Out = %b",$time,In,LR,n,Out);
    end
endmodule