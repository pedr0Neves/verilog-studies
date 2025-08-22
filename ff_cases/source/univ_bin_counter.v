`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 07:17:20 PM
// Design Name: 
// Module Name: univ_bin_counter
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


module univ_bin_counter
#(parameter N=8)
(   input wire clk, rst,
    input wire syn_clr, load, en, up,
    input wire [N-1:0] d,
    output wire max_tick, min_tick,
    output wire [N-1:0] q);
    
    // declaraçao de sinal
    reg [N-1:0] r_reg, r_next;
    
    //corpo registrador
    always @(posedge clk, posedge rst) begin
        r_reg <= r_next;
        if(rst) begin
            r_reg <= {N{1'b0}};
        end
    end
    
    //proximo estado logico
    always @* begin
        if(syn_clr) begin
            r_next = 0;
        end else if(load) begin
            r_next = d;
        end else if(en & up) begin
            r_next = r_reg + 1'b1;
        end else if(en & ~up) begin
            r_next = r_reg - 1'b1;
        end else begin
            r_next = r_reg;
        end
    end
    
    // saida logica
    assign q = r_reg;
    assign max_tick = (r_reg==2**N-1) ? 1'b1 : 1'b0;
    assign min_tick = (r_reg==0) ? 1'b1 : 1'b0;
endmodule
