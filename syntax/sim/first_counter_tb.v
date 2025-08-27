`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2025 09:40:41 AM
// Design Name: 
// Module Name: first_counter_tb
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


module first_counter_tb;
    reg clk, rst, enable;
    wire [3:0] cnt_out;
    
    first_counter UUT (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .cnt_out(cnt_out)
    );

    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        rst = 1;
        enable = 0;
        
        #10;
        rst = 0;
        enable = 1;
        
        #200;
        enable = 0;
        
        #50;
        enable = 1;
        
        #100;
        rst = 1;
        
        #20
        rst = 0;
        
        $display("Simulation completed successfully!");
        $finish;
    end
endmodule
