`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2025 10:12:43 PM
// Design Name: 
// Module Name: disp_mux_tb
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


module disp_mux_tb();
    localparam T=20;
    reg clk, rst;
    reg [7:0] in0, in1, in2, in3;
    wire [7:0] sseg;
    wire [3:0] an;
    
    disp_mux uut (.clk(clk),
                  .rst(rst),
                  .in0(in0),
                  .in1(in1),
                  .in2(in2),
                  .in3(in3),
                  .sseg(sseg),
                  .an(an));
                  
    always begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
    
    initial begin
        rst = 1'b1;
        #(T);
        rst = 1'b0;
    end
    
    initial begin
        // ====== monitor geral ======
        $monitor("t=%0t | clk=%0b, rst=%0b, | in0=%0d, in1=%0d, in2=%0d, in3=%0d | sseg=%0d, an=%0d", $time, clk, rst, in0, in1, in2, in3, sseg, an);
        
        // inicializando o valores
        $display("\n=== initial input ===");
        in0 = 8'h00;
        in1 = 8'h00;
        in2 = 8'h00;
        in3 = 8'h00;
        @(negedge clk);
        #(T);
        
        // testando entrada in0
        $display("\n=== testing in0 ===");
        in0 = 8'h01;
        wait(an == 4'hE);
        @(negedge clk);
        
        // testando entrada in1
        $display("\n=== testing in1 ===");
        in1 = 8'h02;
        wait(an == 4'hD);
        @(negedge clk);
        
        // testando entrada in2
        $display("\n=== testing in2 ===");
        in2 = 8'h03;
        wait(an == 4'hB);
        @(negedge clk);
        
        // testando entrada in3
        $display("\n=== testing in3 ===");
        in3 = 8'h04;
        wait(an == 4'h7);
        @(negedge clk);
        
        // testando reset
        $display("\n=== testing reset ===");
        #(2*T);
        rst = 1'b1;
        #(3*T);
        rst = 1'b0;
        @(negedge clk);
        
        // mudando valores
        $display("\n=== changing inputs ===");
        in0 = 8'h1B;
        in1 = 8'h47;
        in2 = 8'hA0;
        in3 = 8'hFF;
        @(negedge clk);
        
        #(10*T);
        
        // parar simulaçao
        $display("\n=== Fim da simulação ===");
        $stop;   
        
        
    end
endmodule
