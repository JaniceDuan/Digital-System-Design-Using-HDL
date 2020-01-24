`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/01 15:44:01
// Design Name: 
// Module Name: matrix
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


module matrix(input CLK );
reg [39:0]a0;
reg [39:0]a1;
reg [39:0]a2;
reg [39:0]b0;
reg [39:0]b1;
reg [39:0]b2;
reg [7:0] ain0;
reg [7:0] ain1;
reg [7:0] ain2;
reg [7:0] bin0;
reg [7:0] bin1;
reg [7:0] bin2;
wire [7:0] a_mid01_o[3:0];
reg [7:0] a_mid01_i[3:0];
wire [7:0] a_mid12_o[3:0];
reg [7:0] a_mid12_i[3:0];
wire [7:0] a_mid23_o[3:0];
wire [7:0] b_mid01_o[3:0];
reg [7:0] b_mid01_i[3:0];
wire [7:0] b_mid12_o[3:0];
reg [7:0] b_mid12_i[3:0];
wire [7:0] b_mid23_o[3:0];
wire [7:0] result [8:0];
initial 
begin
    a0 = 40'h0000003030; 
    a1 = 40'h0000303000; 
    a2 = 40'h0030300000; 
    b0 = 40'h0000B8B8B8; 
    b1 = 40'h00B8B8B800; 
    b2 = 40'hB8B8B80000; 
end
always @(posedge CLK)
begin
    ain0 <= a0[7:0];
    ain1 <= a1[7:0];
    ain2 <= a2[7:0];
    bin0 <= b0[7:0];
    bin1 <= b1[7:0];
    bin2 <= b2[7:0];
    a0 <= a0 >> 8;
    a1 <= a1 >> 8;
    a2 <= a2 >> 8;
    b0 <= b0 >> 8;
    b1 <= b1 >> 8;
    b2 <= b2 >> 8;
    a_mid01_i[0] <= a_mid01_o[0];
    a_mid01_i[1] <= a_mid01_o[1];
    a_mid01_i[2] <= a_mid01_o[2];
    b_mid01_i[0] <= b_mid01_o[0];
    b_mid01_i[1] <= b_mid01_o[1];
    b_mid01_i[2] <= b_mid01_o[2];
    a_mid12_i[0] <= a_mid12_o[0];
    a_mid12_i[1] <= a_mid12_o[1];
    a_mid12_i[2] <= a_mid12_o[2];
    b_mid12_i[0] <= b_mid12_o[0];
    b_mid12_i[1] <= b_mid12_o[1];
    b_mid12_i[2] <= b_mid12_o[2];
end
MAC MAC00(.CLK(CLK),.ain(ain0),.bin(bin0),.aout(a_mid01_o[0]),.bout(b_mid01_o[0]));
MAC MAC10(.CLK(CLK),.ain(ain1),.bin(b_mid01_i[0]),.aout(a_mid01_o[1]),.bout(b_mid12_o[0]));
MAC MAC20(.CLK(CLK),.ain(ain2),.bin(b_mid12_i[0]),.aout(a_mid01_o[2]),.bout(b_mid23_o[0]));
MAC MAC01(.CLK(CLK),.ain(a_mid01_i[0]),.bin(bin1),.aout(a_mid12_o[0]),.bout(b_mid01_o[1]));
MAC MAC11(.CLK(CLK),.ain(a_mid01_i[1]),.bin(b_mid01_i[1]),.aout(a_mid12_o[1]),.bout(b_mid12_o[1]));
MAC MAC21(.CLK(CLK),.ain(a_mid01_i[2]),.bin(b_mid12_i[1]),.aout(a_mid12_o[2]),.bout(b_mid23_o[1]));
MAC MAC02(.CLK(CLK),.ain(a_mid12_i[0]),.bin(bin2),.aout(a_mid23_o[0]),.bout(b_mid01_o[2]));
MAC MAC12(.CLK(CLK),.ain(a_mid12_i[1]),.bin(b_mid01_i[2]),.aout(a_mid23_o[1]),.bout(b_mid12_o[2]));
MAC MAC22(.CLK(CLK),.ain(a_mid12_i[2]),.bin(b_mid12_i[2]),.aout(a_mid23_o[2]),.bout(b_mid23_o[2]));
assign result[0] = MAC00.save;
assign result[1] = MAC01.save;
assign result[2] = MAC02.save;
assign result[3] = MAC10.save;
assign result[4] = MAC11.save;
assign result[5] = MAC12.save;
assign result[6] = MAC20.save;
assign result[7] = MAC21.save;
assign result[8] = MAC22.save;
endmodule

