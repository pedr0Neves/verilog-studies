`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2025 02:02:48 AM
// Design Name: 
// Module Name: edge_detect_mealy
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


module edge_detect_mealy
(   input wire clk, rst,
    input wire level,
    output wire tick);
    
    localparam zero = 1'b0, one = 1'b1;
                     
    reg state_reg, state_next;
    
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
            zero:if(level) begin
                    state_next = one;
                end
            one:if(~level) begin
                    state_next = zero;
                end
            default: state_next = zero;
        endcase
    end
    
    assign tick = (state_next==one) & level;
endmodule
