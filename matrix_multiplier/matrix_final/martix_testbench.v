`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/01 16:12:58
// Design Name: 
// Module Name: martix_testbench
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


module martix_testbench(

    );
	reg clk;

	initial begin	
		clk = 0;
		
	end
	
	always #5 clk = ~clk;//10MHz
    matrix matrix1(clk);
endmodule
