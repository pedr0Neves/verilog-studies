`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2025 12:01:18 AM
// Design Name: 
// Module Name: fib
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


module fib(
    input wire clk, rst,
    input wire start,
    input wire [4:0] i,
    output reg ready, done_tick,
    output wire [19:0] f);
    
    localparam [1:0] idle   = 2'b00,
                     op     = 2'b01,
                     done   = 2'b10;
    
    localparam N = 20;
    
    reg [4:0] n_reg, n_next;
    reg [N-1:0] t0_reg, t0_next, t1_reg, t1_next;
    reg [1:0] state_next, state_reg;
    
    // Registrador de estados logicos
    always @(posedge clk, posedge rst) begin
        state_reg <= state_next;
        if(rst) begin
            state_reg <= idle;
        end
    end
    
    // Registrador t0
    always @(posedge clk, posedge rst) begin
        t0_reg <= t0_next;
        if(rst) begin
            t0_reg <= {N{1'b0}};
        end
    end
    
    // Registrador t1
    always @(posedge clk, posedge rst) begin
        t1_reg <= t1_next;
        if(rst) begin
            t1_reg <= {N{1'b0}};
        end
    end
    
    // Registrador n
    always @(posedge clk, posedge rst) begin
        n_reg <= n_next;
        if(rst) begin
            n_reg <= 5'b00000;
        end
    end
    
    // FSM
    always @* begin
        state_next = state_reg;
        t0_next = t0_reg;
        t1_next = t1_reg;
        n_next = n_reg;
        done_tick = 1'b0;
        ready = 1'b0;
        case(state_reg)
            idle: 
                begin
                    ready = 1'b1;
                    if(start) begin
                        t0_next = 0;
                        t1_next = 20'd1;
                        n_next  = i;
                        state_next = op;
                    end
                end
            op: 
                begin
                    if(n_reg==0) begin
                        state_next = done;
                        t1_next = 0;
                    end else if (n_reg==1) begin
                        state_next = done;
                    end else begin
                        t1_next = t1_reg + t0_reg;
                        t0_next = t1_reg;
                        n_next = n_reg - 1'b1;
                    end
                end
            done: 
                begin
                    done_tick = 1'b1;
                    state_next = idle;
                end
            default: state_next = idle;
        endcase
    end
    
    assign f = t1_reg;
endmodule
