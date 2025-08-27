`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2025 09:58:09 PM
// Design Name: 
// Module Name: 1_bit_comp
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

/*
Esse codigo eh para propositos de estudos
caso: gate-level 1-bit comparator
eq = i0 * i1 + ~i0 * ~i1
*/
module one_bit_comp(
    input wire i0,
    input wire i1,
    input wire eq
    );
    
    wire p0, p1;
    
    assign p0 = ~i0 &  ~i1;
    assign p1 = i0 & i1;
    assign eq = p0 | p1;
    
    /*
    No verilog, podemos usar primitives predefinidos ao qual podem ser inicializados como modulos, ao qual pode ser
    facilmente trocado por operaçoes bit-a-bit
    
    
    wire i0_n, i1_n;
    
    not unit1 (i0_n, i0);       // i0_n = ~i0;
    not unit2 (i1_n, i1);       // i1_n = ~i1;
    and unit3 (p0, i0_n, i1_n); // p0   = i0_n & i1_n;
    and unit4 (p1, i0, i1);     // p1   = i0 & i1;
    or  unit5 (eq, p0, p1);     // eq   = p0 | p1;
    */
    
endmodule
