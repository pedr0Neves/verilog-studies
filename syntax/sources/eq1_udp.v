`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2025 10:59:18 PM
// Design Name: 
// Module Name: eq1_udp
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


primitive eq1_udp(eq, i0, i1);
    output eq;
    input i0, i1;
    
    table
    //  i0 i1 :  eq
        0  0  :  1;
        0  1  :  0;
        1  0  :  0;
        1  1  :  1;
    endtable
endprimitive
