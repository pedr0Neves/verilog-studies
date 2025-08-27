`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2025 02:02:48 AM
// Design Name: 
// Module Name: edge_detect_moore
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


module edge_detect_moore
(   input wire clk, rst,
    input wire level,
    output wire tick);
    
    localparam [1:0] zero = 2'b00,
                     edg = 2'b01,
                     one = 2'b10;
                     
    reg [1:0] state_reg, state_next;
    
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            state_reg <= zero;
        end else begin
            state_reg <= state_next;
        end
    end
    
    always @* begin
        state_next = state_reg;
        case(state_reg)
            zero:begin
                    if(level) begin
                        state_next = edg;
                    end
                end
            edg:begin
                    if(level) begin
                        state_next = one;
                    end else begin
                        state_next = zero;
                    end
                end
            one:begin
                    if(~level) begin
                        state_next = zero;
                    end
                end
            default: state_next = zero;
        endcase
    end
    
    
    assign tick = (state_next==edg);
endmodule
