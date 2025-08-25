`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2025 06:32:37 PM
// Design Name: 
// Module Name: disp_mux
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


module disp_mux #(parameter B=8) (
    input wire clk, rst,
    input wire [B-1:0] in0, in1, in2, in3,
    output reg [B-1:0] sseg,
    output reg [3:0] an);
    
    localparam N=4;
    
    wire [N-1:0] q_next;
    reg [N-1:0] q_reg;
    
    always @(posedge clk, posedge rst) begin
        q_reg <= q_next;
        if(rst) begin
            q_reg <= 4'b0000;
        end
    end
    
    assign q_next = q_reg + 1'b1;
    
    always @* begin
        case({q_reg[N-1],q_reg[N-2]})
            2'b00:
                begin
                    an = 4'hE;
                    sseg = in0;
                end
            2'b01:
                begin
                    an = 4'hD;
                    sseg = in1;
                end
            2'b10:
                begin
                    an = 4'hB;
                    sseg = in2;
                end
            default:
                begin
                    an = 4'h7;
                    sseg = in3;
                end
        endcase
    end
endmodule
