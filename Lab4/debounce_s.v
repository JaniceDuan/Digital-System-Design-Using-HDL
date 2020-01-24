`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/23 00:26:56
// Design Name: 
// Module Name: debounce_s
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


`timescale 1ns / 1ps
module debounce_s(clk,key_i,key_o);
    input clk;
    input key_i;
    output key_o;

    reg key_o_temp;

    reg key_m;
	reg key_i_t1;

    assign key_o = key_o_temp && key_i_t1;
	
	always @ (posedge clk) 
	begin
		key_i_t1 <= key_i;
		key_o_temp <= key_i_t1;
	end

endmodule


