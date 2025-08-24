`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2025 12:22:55 AM
// Design Name: 
// Module Name: d_ff_en_tb
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


module d_ff_en_tb();
    localparam T = 20;
    reg clk, rst, en;
    reg d;
    wire q, q_rst, q_en;
    
    d_ff d_ff(.clk(clk),
              .d(d),
              .q(q));
    
    d_ff_reset d_ff_rst(.clk(clk),
                        .rst(rst),
                        .d(d),
                        .q(q_rst));
    
    d_ff_en_2s d_ff_en(.clk(clk),
                    .rst(rst),
                    .en(en),
                    .d(d),
                    .q(q_en));
    
    // clock
    always begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
    
    // outro estimulos
    initial begin
        // ===== entrada de inicio =======
        rst = 1'b1;
        en = 1'b0;
        d = 1'b0;
        @(negedge clk);
        
        // ===== testando d_tt =====
        d = 1'b1;
        repeat(2) @(negedge clk);
        @(negedge clk);
        
        // ===== testando d_tt_rst =====
        rst = 1'b0;
        repeat(2) @(negedge clk);
        @(negedge clk);
        
        // ===== testando d_tt_en =====
        en = 1'b1;
        repeat(2) @(negedge clk);
        
        d = 1'b0;
        repeat(2) @(negedge clk);
        
        rst = 1'b1;
        d = 1'b1;
        repeat(2) @(negedge clk)   
        
        // parar simulaçao
        $stop;      
    end
endmodule
