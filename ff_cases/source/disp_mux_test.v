`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2025 06:58:39 PM
// Design Name: 
// Module Name: disp_mux_test
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


module disp_mux_test(
    input wire clk, rst,
    input wire [7:0] sw,
    input wire [3:0] btn,
    output wire [7:0] sseg,
    output wire [3:0] an);
    
    reg [7:0] d3_reg, d2_reg, d1_reg, d0_reg;
    
    disp_mux disp_unit (.clk(clk),
                        .rst(rst),
                        .in0(d0_reg),
                        .in1(d1_reg),
                        .in2(d2_reg),
                        .in3(d3_reg),
                        .sseg(sseg),
                        .an(an));
    
    always @(posedge clk) begin
        if(btn[3]) begin
            d3_reg <= sw;
        end if(btn[2]) begin
            d2_reg <= sw;
        end if(btn[1]) begin
            d1_reg <= sw;
        end if(btn[0]) begin
            d0_reg <= sw;
        end
    end
endmodule
