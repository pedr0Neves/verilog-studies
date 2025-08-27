`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2025 01:47:08 AM
// Design Name: 
// Module Name: fsm_eg_ex
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


module fsm_eg_ex
    (
        input wire clk, rst,
        input wire a, b,
        output wire y0, y1
    );
    
    // declaraçao dos estados simbolicos
    localparam [1:0] s0 = 2'b00,
                     s1 = 2'b01,
                     s2 = 2'b10;
    
    // declaraçao dos sinais
    reg [1:0] state_reg, state_next;
    
    // registrador de estados
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            state_reg <= s0;
        end else begin
            state_reg <= state_next;
        end
    end
    
    // proximo estado logico
    always @* begin
        case(state_reg)
            s0: begin
                    if(a) begin
                        if(b) begin
                            state_next = s2;
                        end else begin
                            state_next = s1;
                        end
                    end else begin
                        state_next = s0;
                    end
                end
            s1: begin
                    if(a) begin
                        state_next = s0;
                    end else begin
                        state_next = s1;
                    end
                end
            s2: begin
                    state_next = s0;
                end
            default: state_next = s0;
        endcase
    end
    
    // saida logica Moore
    assign y1 = (state_reg==s0) || (state_reg==s1);
    
    // saida logica Mealy
    assign y0 = (state_reg==s0) & a & b;
endmodule
