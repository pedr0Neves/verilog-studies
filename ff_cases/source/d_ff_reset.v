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


module d_ff_reset
(   input wire clk, rst,
    input wire d,
    output reg q);
    
    always @(posedge clk, posedge rst) begin
        q <= d;
        if(rst) 
            q <= 1'b0;
    end
endmodule
