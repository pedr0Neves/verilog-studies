`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 07:17:20 PM
// Design Name: 
// Module Name: univ_shift_reg
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

module univ_shift_reg
#(parameter N=8)
(   input wire clk, rst,
    input wire [1:0] ctrl,
    input wire [N-1:0] d,
    output wire [N-1:0] q);
    
    // declaraçao de sinais
    reg [N-1:0] r_reg, r_next;
    
    // corpo registrador
    always @(posedge clk, posedge rst) begin
        r_reg <= r_next;
        if(rst) begin
            r_reg <= {N{1'b0}};
        end
    end
    
    //proximo estado logico
    always @* begin
        case(ctrl)
            2'b00: r_next = r_reg;                      // no op
            2'b01: r_next = {r_reg[N-2:0],d[0]};        // shift left
            2'b10: r_next = {d[N-1], r_reg[N-1:1]};     // shift right
            default: r_next = d;                        // load
        endcase
    end
    
    // output logic
    assign q = r_reg;
endmodule
