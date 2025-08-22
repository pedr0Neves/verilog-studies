`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 08:01:38 PM
// Design Name: 
// Module Name: mod_M_counter
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


module mod_M_counter
#(parameter N=4,
            M=10)
(   input wire clk, rst,
    output wire max_tick,
    output wire [N-1:0] q);
    
    // declacaraçao de sinal
    reg [N-1:0] r_reg;
    wire [N-1:0] r_next;
    
    // corpo registrador
    always @(posedge clk, posedge rst) begin
        r_reg <= r_next;
        if(rst) begin
            r_reg <= {N{1'b0}};
        end
    end
    
    // proximo extado logico
    assign r_next = (r_reg==(M-1)) ? 0 : r_reg + 1;
    
    // saida logica
    assign q = r_reg;
    assign max_tick = (r_reg==(M-1)) ? 1'b1 : 1'b0;
endmodule
