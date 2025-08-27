// The 'timescale directiv especifies  that
// the simulation time unit is 1 ns and
// the simulation timestep is 10 ps
`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2025 11:11:14 PM
// Design Name: 
// Module Name: two_bit_comp_tb
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


module two_bit_comp_tb;
    reg [1:0] test_in0, test_in1;
    wire test_out, test_eq;
    
    two_bit_comp uut (.a(test_in0),
                      .b(test_in1),
                      .aeqb(test_out),
                      .eq(test_eq));
    
    initial begin
        // test vector 1
        test_in0 = 2'b00;
        test_in1 = 2'b00;
        # 200;
        
        // test vector 2
        test_in0 = 2'b01;
        test_in1 = 2'b00;
        # 200;
        
        // test vector 3
        test_in0 = 2'b01;
        test_in1 = 2'b11;
        # 200;
        
        // test vector 4
        test_in0 = 2'b10;
        test_in1 = 2'b10;
        # 200;
        
        // test vector 5
        test_in0 = 2'b10;
        test_in1 = 2'b00;
        # 200;
        
        // test vector 6
        test_in0 = 2'b11;
        test_in1 = 2'b11;
        # 200;
        
        // test vector 7
        test_in0 = 2'b11;
        test_in1 = 2'b01;
        # 200;
        
        // stop simulation
        $stop;
    end
endmodule
