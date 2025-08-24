`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 08:05:24 PM
// Design Name: 
// Module Name: mod_M_counter_tb
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


module mod_M_counter_tb();
    localparam T = 20;
    reg clk, rst;
    wire max_tick;
    wire [3:0] q;
    
    mod_M_counter #(.N(4), .M(10)) uut(.clk(clk),
                                      .rst(rst),
                                      .max_tick(max_tick),
                                      .q(q));
    
    always begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
    
    initial begin
        rst = 1'b1;
        #(T);
        rst = 1'b0;
    end
    
    initial begin
        // ===== monitor geral ======
        $monitor("t=%0t | clk=%b rst=%b max_tick=%b | q=%0d",
                  $time, clk, rst, max_tick, q);
        
        #(15*T);
        // testando rst
        $display("\n=== Teste de reset ===");
        rst = 1'b1;
        #(2*T);
        rst = 1'b0;        
        #(10*T);
        
        $display("\n=== Fim da simulação ===");
        // parar simulaçao
        $stop;          
    end
endmodule
