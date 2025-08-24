`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 08:05:24 PM
// Design Name: 
// Module Name: bin_counter_tb
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


module bin_counter_tb();
    // declaraçao
    localparam T=20;    // periodo do clock
    reg clk, rst;
    reg syn_clr, load, en, up;
    reg [2:0] d;
    wire max_tick, min_tick;
    wire [2:0] q;
    
    // incializaçao do UUT (Unit Under Test)
    univ_bin_counter #(.N(3)) uut (.clk(clk),
                                   .rst(rst),
                                   .syn_clr(syn_clr),
                                   .load(load),
                                   .en(en),
                                   .up(up),
                                   .d(d),
                                   .max_tick(max_tick),
                                   .min_tick(min_tick),
                                   .q(q));
                                   
    // clock
    always begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
    
    // ativando o reset no primeiro ciclo de clock
    initial begin
        rst = 1'b1;
        #(T/2);
        rst = 1'b0;
    end
    
    // outro estimulos
    initial begin
        // ===== entrada de inicio =======
        syn_clr = 1'b0;
        load = 1'b0;
        en = 1'b0;
        up = 1'b0;
        d = 3'b000;
        @(negedge rst);
        @(negedge clk);
        
        // ===== testando load =====
        load = 1'b1;
        d = 3'b011;
        @(negedge clk);
        load = 1'b0;
        repeat(2) @(negedge clk);
        
        // ===== testando syn_clr =====
        syn_clr = 1'b1;
        @(negedge clk);
        syn_clr = 1'b0;
        
        // ===== testando up ======
        en = 1'b1;
        up = 1'b1;
        repeat(10) @(negedge clk);
        en = 1'b0;
        repeat (2) @ (negedge clk);
        en = 1'b1;
        repeat (2) @(negedge clk);
        up = 1'b0;
        repeat(10) @(negedge clk);
        
        // continue ate q = 2
        wait(q == 2);
        @(negedge clk);
        up = 1'b1;
        
        // continue ate min_tick = 1
        @(negedge clk);
        wait(min_tick);
        @(negedge clk);
        up = 1'b0;
        
        // delay absoluto
        #(4*T);         // espere por 80 ns     
        en = 1'b0;      // pausa
        #(4*T);         // espere por 80 ns
        
        // parar simulaçao
        $stop;
    end
endmodule
