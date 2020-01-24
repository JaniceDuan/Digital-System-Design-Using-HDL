`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/08 15:19:14
// Design Name: 
// Module Name: get_2hz
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


module get_20hz(input sysclk,
output clk_hz
    );
     reg clk_hz1;
    reg [31:0]cnt;
    initial 
    begin
    cnt<=0;
    clk_hz1<=0;
    end
    always @(posedge sysclk)
    begin
    cnt=cnt+1;
    if (cnt==2500000) //ӦΪ2500000
        begin
        clk_hz1=~clk_hz1;
        cnt=0;
        end
    end
    assign clk_hz=clk_hz1;
endmodule
