`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 08:05:24 PM
// Design Name: 
// Module Name: shift_reg_tb
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


module shift_reg_tb();
    // declaraçao
    localparam T=20;    // periodo do clock
    reg clk, rst;
    reg [1:0] ctrl;
    reg [3:0] d;
    wire [3:0] q;
    
    // incializaçao do UUT (Unit Under Test)
    univ_shift_reg #(.N(4)) uut(.clk(clk),
                                .rst(rst),
                                .ctrl(ctrl),
                                .d(d),
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
        ctrl = 2'b00;
        d =4'h0;
        @(negedge rst);
        @(negedge clk);
        
        // ===== testando load =====
        ctrl = 2'b11;
        d = 4'h6;
        @(negedge clk);
        ctrl = 2'b00;
        repeat(2) @(negedge clk);
        
        // ===== testando right shift ======
        ctrl = 2'b01;
        repeat(5) @(negedge clk);
        ctrl = 2'b11;
        d = 4'h6;
        @(negedge clk);
        ctrl = 2'b00;
        @(negedge clk)
        
        // ===== testando left shift ======
        ctrl = 2'b10;
        repeat(5) @(negedge clk);
        ctrl = 2'b00;
        @(negedge clk)
        
        // delay absoluto
        #(4*T);         // espere por 80 ns     
        rst = 1'b1;      // pausa
        #(4*T);         // espere por 80 ns
        
        // parar simulaçao
        $stop;
    end
endmodule
