`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2025 07:45:47 PM
// Design Name: 
// Module Name: debounce_explicit
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


module debounce_explicit(
    input wire clk, rst,
    input wire sw,
    output reg db_level, db_tick);
    
    localparam [1:0] zero   = 2'b00,
                     wait1  = 2'b01,
                     one    = 2'b10,
                     wait0  = 2'b11;
                     
    localparam N = 21;
    
    reg [1:0] state_reg, state_next;
    reg [N-1:0] q_reg;
    wire [N-1:0] q_next;
    wire q_zero;
    reg q_load, q_dec;
    
    always @(posedge clk, posedge rst) begin
        state_reg <= state_next;
        q_reg <= q_next;
        if(rst) begin
            state_reg <= zero;
            q_reg <= 0;
        end
    end
    
    assign q_next = (q_load) ? {N{1'b1}} :
                    (q_dec) ? q_reg - 1'b1 :
                              q_reg;
                              
    assign q_zero = (q_next==0);
    
    always @* begin
        state_next = state_reg;
        q_load = 1'b0;
        q_dec = 1'b0;
        db_level = 1'b0;
        db_tick = 1'b0;
        case(state_reg)
            zero:
                if(sw) begin
                    q_load = 1'b1;
                    state_next = wait1;
                end
            wait1:
                if(sw) begin
                    q_dec = 1'b1;
                        if(q_zero) begin
                            db_tick = 1'b1;
                            state_next = one;
                        end
                end else begin
                    state_next = zero;
                end
            one: begin
                db_level = 1'b1;
                if(~sw) begin
                    q_load = 1'b1;
                    state_next = wait0;
                end
            end
            wait0: begin
                db_level = 1'b1;
                if(~sw) begin
                    q_dec = 1'b1;
                    if(q_zero)
                        state_next = zero;
                end else begin
                    state_next = one;
                end
            end
            default: state_next = zero;
        endcase
    end
endmodule
