`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 05:18:39 PM
// Design Name: 
// Module Name: case_ex
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


module case_ex(
    input [1:0] a,
    input en,
    output [3:0] y
    );
    
    wire [1:0] a;
    wire en;
    reg [3:0] y;
    
    // this case shows a case structure
    // in which one of these items and statements is valid
    always @*
        case ({en, a})
            3'b100: 
                y = 4'b0001;
            3'b101: y = 4'b0010;
            3'b110:
                begin
                    y = 4'b0100;
                end
            3'b111:
                y = 4'b1000;
            default:
                y = 4'b0000;
        endcase
endmodule
