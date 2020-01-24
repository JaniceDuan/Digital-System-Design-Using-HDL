`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2019 08:43:43 PM
// Design Name: 
// Module Name: keyboard_design
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


module keyboard_design(CLK,ps2clk,data,an,seg,newkeyStrobe);
input CLK,ps2clk,data;
output [3:0]an;
output [6:0]seg;
output newkeyStrobe;

wire [7:0]keycode;

wire [21:0]Q;
wire detect,idle;


shifter22 shift(ps2clk,data,Q,keycode,detect,idle);
Strobe str(CLK,detect,newkeyStrobe);
sevenSeg sev(CLK, idle, keycode, an, seg);
endmodule
