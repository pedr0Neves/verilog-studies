`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 05:05:16 PM
// Design Name: 
// Module Name: register
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


module register
(   input wire clk, rst,
    input wire en,
    input wire [7:0] d,
    output reg [7:0] q);
    
    /* modo 1:
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            q <= 8'h00;
        end else if(en) begin
            q <= d;
        end
    end
    */
    
    /* modo 2
    d_ff_en_1s ff0 (.clk(clk), .rst(rst), .d(d[0]), .q(q[0]));
    d_ff_en_1s ff1 (.clk(clk), .rst(rst), .d(d[1]), .q(q[1]));
    d_ff_en_1s ff2 (.clk(clk), .rst(rst), .d(d[2]), .q(q[2]));
    d_ff_en_1s ff3 (.clk(clk), .rst(rst), .d(d[3]), .q(q[3]));
    d_ff_en_1s ff4 (.clk(clk), .rst(rst), .d(d[4]), .q(q[4]));
    d_ff_en_1s ff5 (.clk(clk), .rst(rst), .d(d[5]), .q(q[5]));
    d_ff_en_1s ff6 (.clk(clk), .rst(rst), .d(d[6]), .q(q[6]));
    d_ff_en_1s ff7 (.clk(clk), .rst(rst), .d(d[7]), .q(q[7]));
    */
    
    // modo 3
    genvar i;
    generate
        for(i = 0; i < 8; i = i + 1) begin : reg_loop
            d_ff_en_1s ff(.clk(clk), .rst(rst), .en(en), .d(d[i]), .q(q[i]));
        end
    endgenerate
endmodule
