`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2025 09:58:09 PM
// Design Name: 
// Module Name: 2_bit_comp
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


module two_bit_comp(
    input [1:0] a,
    input [1:0] b,
    output aeqb, eq
    );
    
    wire [1:0] a;
    wire [1:0] b;
    wire aeqb, eq;
    wire e0, e1;
    
    assign p0 = (~a[1] & ~b[1]) & (~a[0] & ~b[0]);
    assign p1 = (~a[1] & ~b[1]) & (a[0] & b[0]);
    assign p2 = (a[1] & b[1]) & (~a[0] & ~b[0]);
    assign p3 = (a[1] & b[1]) & (a[0] & b[0]);
    assign aeqb = p0 | p1 | p2 | p3;
    
    /*
    De forma alternativa, pode fazer um instaciacao de modulo usando o modulo 1_bit_comp
    para montar 2_bit comp sem ter que refazer a logica do modulo, apenas reutilizando um ja existente.
    */
    
    one_bit_comp eq_bit0_unit (.i0(a[0]), .i1(b[0]), .eq(e0));
    one_bit_comp eq_bit1_unit (.i0(a[1]), .i1(b[1]), .eq(e1));
    
    assign eq = e0 & e1;
endmodule
