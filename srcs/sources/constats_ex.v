`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 07:41:58 PM
// Design Name: 
// Module Name: constats_ex
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


module constats_ex #(parameter N = 4)(
    input wire [N-1:0] a, b,
    output wire [N-1:0] sum,
    output wire c_out
    );
    
    // declaraçao das constantes
    localparam N1 = N-1;
    
    // declaraçao dos sinais
    wire [N:0] sum_ext;
    
    // corpo
    assign sum_ext = {1'b0, a} + {1'b0, b};
    assign sum = sum_ext[N1:0];
    assign c_out = sum_ext[N];
endmodule
