`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 05:18:39 PM
// Design Name: 
// Module Name: if_else_ex
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


module if_else_ex(
    input wire [1:0] a,
    input wire en,
    output reg [3:0] y
    );
    
    /*
    caso nao seja colocado no module, pode ser citado abaixo
    wire [1:0] a;
    wire en;
    reg [3:0] y;
    */
    
    always @(en, a)         // pode ser colocado apenas como: always @*
        if(en == 1'b0)      // pode ser escrito como (~en)
            y = 4'b0000;
        else if (a == 2'b00)
            y = 4'b0001;
        else if (a == 2'b01)
            y = 4'b0010;
        else if (a == 2'b10)
            y = 4'b0100;
        else
            y = 4'b1000;
            
    /*
    Para caso de estudo, podemos aplicar a seguinte logica
    onde se concatena o sinal en + a -> {en, a}
    
    always @(en, a)
        if({en,a} == 3'b100)
            y = 4'b0001;
        else if ({en,a} == 3'b101)
            y = 4'b0010;
        else if ({en,a} == 3'b110)
            y = 4'b0100;
        else if ({en,a} == 3'b111)
            y = 4'b1000;
        else
            y = 4'b0000;
    */
endmodule
