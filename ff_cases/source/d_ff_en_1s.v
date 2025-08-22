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


module d_ff_en_1s
(   input wire clk, rst,
    input wire en,
    input wire d,
    output reg q);
    
    always @(posedge clk, posedge rst) begin
        if(rst) 
            q <= 1'b0;
        else if (en)
            q <= d;
    end
endmodule
