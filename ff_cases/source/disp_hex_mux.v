`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2025 07:42:57 PM
// Design Name: 
// Module Name: disp_hex_mux
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


module disp_hex_mux(
    input wire clk, rst,
    input wire [3:0] hex3, hex2, hex1, hex0,
    input wire [3:0] dp_in,
    output wire [3:0] an,
    output reg [7:0] sseg);
    
    wire [3:0] mux_out;
    reg dp;
    
    disp_mux #(.B(4)) disp_unit (.clk(clk),
                                 .rst(rst),
                                 .in0(hex0),
                                 .in1(hex1),
                                 .in2(hex2),
                                 .in3(hex3),
                                 .sseg(mux_out),
                                 .an(an));
    
    always @* begin
        case(mux_out)
            4'h0:
                begin
                    sseg[6:0] = 7'b0000001;
                end
            4'h1:
                begin
                    sseg[6:0] = 7'b1001111;
                end
            4'h2:
                begin
                    sseg[6:0] = 7'b0010010;
                end
            4'h3:
                begin
                    sseg[6:0] = 7'b0000110;
                end
            4'h4:
                begin
                    sseg[6:0] = 7'b1001100;
                end
            4'h5:
                begin
                    sseg[6:0] = 7'b0100100;
                end
            4'h6:
                begin
                    sseg[6:0] = 7'b0100000;
                end
            4'h7:
                begin
                    sseg[6:0] = 7'b0001111;
                end
            4'h8:
                begin
                    sseg[6:0] = 7'b0000000;
                end
            4'h9:
                begin
                    sseg[6:0] = 7'b0000100;
                end
            4'hA:
                begin
                    sseg[6:0] = 7'b0001000;
                end
            4'hB:
                begin
                    sseg[6:0] = 7'b1100000;
                end
            4'hC:
                begin
                    sseg[6:0] = 7'b0110001;
                end
            4'hD:
                begin
                    sseg[6:0] = 7'b1000010;
                end
            default:
                begin
                    sseg[6:0] = 7'b0111000;
                end
        endcase
    end
    
    always @* begin
        case(an)
            4'hE:
                begin
                    sseg[7] = dp_in[0];
                end
            4'hD:
                begin
                    sseg[7] = dp_in[1];
                end
            4'hB:
                begin
                    sseg[7] = dp_in[2];
                end
            4'h7:
                begin
                    sseg[7] = dp_in[3];
                end
        endcase
    end
endmodule
