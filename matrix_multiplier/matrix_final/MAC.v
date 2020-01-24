`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/01 15:36:26
// Design Name: 
// Module Name: MAC
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


module MAC(input CLK,input [7:0] ain,input [7:0] bin, output [7:0] aout, output [7:0] bout);
    reg [7:0] save;
    wire [7:0] multi_rslt;
    wire [7:0] add_rslt;
    wire clkn;
    assign clkn = ~CLK;
    initial 
    save = 0;
    
    multi multi1(ain,bin,multi_rslt);
    add add1 (clkn,save,multi_rslt ,add_rslt);
    
    always @(*)
    begin
    save = add_rslt;
    end
assign aout = ain;
assign bout = bin;
endmodule
