`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/08 19:17:41
// Design Name: 
// Module Name: tb_fitbit
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


module tb_parking_meter(

    );

	reg sysclk;
	reg [1:0]sw;
	reg U;
	reg L;
	reg R;
	reg D;
	
	wire [7:0]cathodes;
	wire [3:0] AN;
	initial begin
		sysclk = 1;
		U = 0;
		L = 0;
		R = 0;
		D = 0;
		sw = 2'b00; 
		#100000 U = 1;
		#40000 U = 0;
		#100000 U = 1;
		#40000 U = 0;
	end
	
	always #5 sysclk = ~sysclk;//10MHz
		
    
    parking_meter parking_meter1(sysclk, U, L, R,D,sw, cathodes, AN );
endmodule
