`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2025 03:08:03 AM
// Design Name: 
// Module Name: div
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


module div #(parameter W = 8, CBIT = 4)
(   input wire clk, rst,
    input wire start,
    input wire [W-1:0] dvsr, dvnd,
    output reg ready, done_tick,
    output wire [W-1:0] quo, rmd);
    
    localparam [1:0] idle   = 2'b00,
                     op     = 2'b01,
                     last   = 2'b10,
                     done   = 2'b11;
                     
    reg [1:0] state_reg, state_next;
    reg [W-1:0] rh_reg, rh_next, rl_reg, rl_next, rh_tmp;
    reg [W-1:0] d_reg, d_next;
    reg [CBIT-1:0] n_reg, n_next;
    reg q_bit;
    
    always @(posedge clk, posedge rst) begin
        state_reg <= state_next;
        if(rst) begin
            state_reg <= idle;
        end
    end
    
    always @(posedge clk, posedge rst) begin
        rh_reg <= rh_next;
        if(rst) begin
            rh_reg <= {W{1'b0}};
        end
    end
    
    always @(posedge clk, posedge rst) begin
        rl_reg <= rl_next;
        if(rst) begin
            rl_reg <= {W{1'b0}};
        end
    end
    
    always @(posedge clk, posedge rst) begin
        d_reg <= d_next;
        if(rst) begin
            d_reg <= {W{1'b0}};
        end
    end
    
    always @(posedge clk, posedge rst) begin
        n_reg <= n_next;
        if(rst) begin
            n_reg <= {CBIT{1'b0}};
        end
    end
    
    // fsm
    always @* begin
        state_next = state_reg;
        rh_next = rh_reg;
        rl_next = rl_reg;
        d_next = d_reg;
        n_next = n_next;
        ready = 1'b0;
        done_tick = 1'b0;
        case(state_reg)
            idle:
                begin
                    ready = 1'b1;
                    if (start) begin
                        rh_next = {W{1'b0}};
                        rl_next = dvnd;
                        d_next = dvsr;
                        n_next = CBIT;
                        state_next = op;
                    end
                end
            op:
                begin
                    rl_next = {rl_reg[W-2:0], q_bit};
                    rh_next = {rh_reg[W-2:0], rl_reg[W-1]};
                    n_next = n_reg - 1'b1;
                    if (n_next == 1)
                        state_next = last;
                end
            last:
                begin
                    rl_next = {rl_reg[W-2:0], q_bit};
                    rh_next = rh_tmp;
                    state_next = done;
                end
            done:
                begin
                    done_tick = 1'b1;
                    state_next = idle;
                end
            default: state_next = idle;
        endcase
    end
    
    // comparar e subtrair
    always @* begin
        if(rh_reg >= d_reg)
            begin
                rh_tmp = rh_reg - d_reg;
                q_bit = 1'b1;
            end
        else 
            begin
                rh_tmp = rh_reg;
                q_bit = 1'b0;
            end
    end
    
    assign quo = rl_reg;
    assign rmd = rh_reg;
endmodule
