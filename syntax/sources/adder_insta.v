`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 08:16:34 PM
// Design Name: 
// Module Name: adder_insta
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


module adder_insta(
    input wire [3:0] a4, b4,
    input wire [7:0] a8, b8,
    output wire [3:0] sum4,
    output wire c4,
    output wire [7:0] sum8,
    output wire c8
    );
    
    constats_ex #(.N(8)) unit1
        (.a(a8), .b(b8), .sum(sum8), .c_out(c8));
        
    constats_ex unit2
        (.a(a4), .b(b4), .sum(sum4), .c_out(c4));
endmodule
