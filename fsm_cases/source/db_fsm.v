`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2025 06:04:03 PM
// Design Name: 
// Module Name: db_fsm
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


module db_fsm(
    input wire clk, rst,
    input wire sw,
    output reg db);
    
    localparam [2:0] zero    = 3'b000,
                     wait1_1 = 3'b001,
                     wait1_2 = 3'b010,
                     wait1_3 = 3'b011,
                     one     = 3'b100,
                     wait0_1 = 3'b101,
                     wait0_2 = 3'b110,
                     wait0_3 = 3'b111;
     
     localparam N = 19;
     
     wire m_tick;
     wire [N-1:0] q_next;
     reg [N-1:0] q_reg;
     reg [2:0] state_next, state_reg;
     
     // ====================================
     // Contador para gerar ticks de 10ms
     // ====================================
     
     always @(posedge clk) begin
        q_reg <= q_next;
     end
     
     assign q_next = q_reg + 1'b1;
     
     assign m_tick = (q_reg==0) ? 1'b1 : 1'b0;
     
     // ====================================
     // Deboucing FSM
     // ====================================
     
     always @(posedge clk, posedge rst) begin
        if(rst) begin
            state_reg <= zero;
        end else begin
            state_reg <= state_next;
        end
     end
     
     always @* begin
        state_next = state_reg;
        db = 1'b0;
        case(state_reg)
            zero: 
                if(sw)
                    state_next = wait1_1;
            wait1_1:
                if(~sw)
                    state_next = zero;
                else
                    if(m_tick)
                        state_next = wait1_2;
            wait1_2:
                if(~sw)
                    state_next = zero;
                else
                    if(m_tick)
                        state_next = wait1_3;
            wait1_3:
                if(~sw)
                    state_next = zero;
                else
                    if(m_tick)
                        state_next = one;
            one:
                begin
                    db = 1'b1;
                    if(~sw)
                        state_next = wait0_1;
                end
            wait0_1:
                begin
                    db = 1'b1;
                    if(sw)
                        state_next = one;
                    else
                        if(m_tick)
                            state_next = wait0_2;
                end
            wait0_2:
                begin
                    db = 1'b1;
                    if(sw)
                        state_next = one;
                    else
                        if(m_tick)
                            state_next = wait0_3;
                end
            wait0_3:
                begin
                    db = 1'b1;
                    if(sw)
                        state_next = one;
                    else
                        if(m_tick)
                            state_next = zero;
                end
            default: state_next = zero;
        endcase
     end
endmodule
