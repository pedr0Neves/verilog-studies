`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 04:22:24 PM
// Design Name: 
// Module Name: d_ff
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


module d_ff_en_2s
(   input wire clk, rst,
    input wire en,
    input wire d,
    output reg q);
    
    // declaraçao de sinal
    reg r_reg, r_next;
    
    // corpo
    // flip-flop D
    always @(posedge clk, posedge rst) begin
        r_reg <= r_next;
        if(rst) 
            r_reg <= 1'b0;
    end
    
    // proximo estado logico
    always @* begin
        r_next <= r_reg;
        if (en)
            r_next <= d;
    end
    
    // saida logica
    always @* 
        q <= r_reg;
        
    /*
    always @(posedge clk, posedge rst) begin
        q <= r_next;
        if(rst) 
            q <= 1'b0;
    end
    
    always @* begin
        r_next <= q;
        if (en)
            r_next <= d;
    end
    */
endmodule
