`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2025 12:55:37 AM
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb();
    localparam T = 20;
    reg clk, rst;
    reg wr_en;
    reg [3:0] w_addr, r_addr;
    reg [31:0] w_data;
    wire [31:0] r_data;
    
    register_file #(.B(32), .W(4)) uut (.clk(clk),
                                       .rst(rst), 
                                       .wr_en(wr_en), 
                                       .w_addr(w_addr), 
                                       .r_addr(r_addr), 
                                       .w_data(w_data), 
                                       .r_data(r_data));
    
    // clock
    always begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
    
    // ativando o reset no primeiro ciclo de clock
    initial begin
        rst = 1'b1;
        #(T);
        rst = 1'b0;
    end
    
    initial begin
        // ===== monitor geral ======
        $monitor("t=%0t | clk=%b rst=%b wr_en=%b | w_addr=%0d w_data=%0d | r_addr=%0d r_data=%0d",
                  $time, clk, rst, wr_en, w_addr, w_data, r_addr, r_data);
                  
        // ===== entrada de inicio =======
        wr_en = 1'b0;
        w_addr = 4'h0;
        r_addr = 4'h0;
        w_data = 32'h00000000;
        @(negedge clk);
        
        // testando escrita
        $display("\n=== Teste de escrita ===");
        wr_en = 1'b1;
        w_addr = 4'h0;
        w_data = 32'h00000001;
        @(negedge clk);
        w_addr = 4'h1;
        w_data = 32'h00000005;
        @(negedge clk);
        w_addr = 4'h2;
        w_data = 32'h00000003;
        @(negedge clk);
        w_addr = 4'h7;
        w_data = 32'h0000000F;
        @(negedge clk);
        
        // testando a leitura
        $display("\n=== Teste de leitura ===");
        wr_en = 1'b0;
        for (r_addr = 0; r_addr < 8; r_addr = r_addr + 1) begin
            @(negedge clk);
        end
        r_addr = 1'h0;
        @(negedge clk);
        
        // testando rst
        $display("\n=== Teste de reset ===");
        rst = 1'b1;
        #(T);
        rst = 1'b0;        
        #(2*T);
        
        $display("\n=== Fim da simulação ===");
        // parar simulaçao
        $stop;
    end
endmodule
