`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2025 09:28:45 AM
// Design Name: 
// Module Name: first_counter
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


module first_counter(
        clk,
        rst,
        enable,
        cnt_out
    );
    
    input clk;
    input rst;
    input enable;
    output [3:0] cnt_out;
    
    wire clk;
    wire rst;
    wire enable;
    reg [3:0] cnt_out;
    
    always @ (posedge clk)
    begin : COUNTER
        if (rst == 1'b1) begin
            cnt_out <= 4'b0000;
        end
        else if(enable == 1'b1) begin
            cnt_out <= cnt_out + 1;
        end
    end
endmodule
