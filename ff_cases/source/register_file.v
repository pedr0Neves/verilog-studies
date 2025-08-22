`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 05:22:37 PM
// Design Name: 
// Module Name: register_file
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


module register_file
#(parameter B = 8,  // numero de bits
            W = 2)  // numero de endereços
(   input wire clk, rst,
    input wire wr_en,
    input wire [W-1:0] w_addr, r_addr,
    input wire [B-1:0] w_data,
    output wire [B-1:0] r_data);
    
    reg [B-1:0] array_reg [2**W-1:0];
    
    /* modo 1
    // operaçao de escrita
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            for (i = 0; i < 2**W; i = i + 1) begin
                array_reg[i] <= {B{1'b0}};
            end
        end else if(wr_en) begin
            array_reg[w_addr] <= w_data;
        end
    end
    
    // operaçao de leitura
    assign r_data = array_reg[r_addr];
    */
    
    genvar i;
    generate
        for(i = 0; i < 2**W; i = i+1) begin : reg_file_lop
            register reg_inst(.clk(clk), .rst(rst), .en(wr_en & (w_addr == i)), .d(w_data), .q(array_reg[i]));
        end
    endgenerate
    
    assign r_data = array_reg[r_addr];
endmodule
