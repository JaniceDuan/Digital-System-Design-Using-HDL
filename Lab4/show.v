`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/12 19:41:48
// Design Name: 
// Module Name: show
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


module show(input[31:0] cnt_s, input clk_1khz, output [7:0]cathodes,output[3:0] AN );
    reg [1:0] cnt;
    reg [3:0] an;
    reg [3:0] temp;
    wire en;
    sparkling sparkling1(cnt_s, clk_1khz,en );
    initial 
    begin
    temp<=0;
    cnt<=0;
    end
   
   
    always @(posedge clk_1khz)
    begin
    if (!en)
        begin
        an <= 4'b1111;
        end
    else
        if (cnt==0)
            begin
            an <= 4'b1110;
            temp <= cnt_s % 10;
            cnt <= cnt + 1;
            end
        else if (cnt == 1)
            begin
            an <= 4'b1101;
            temp <= (cnt_s / 10) % 10;
            cnt <= cnt + 1;
           end
        else if (cnt==2)
            begin
            an <= 4'b1011;
            temp <= (cnt_s / 100) % 10;
            cnt <= cnt + 1;
            end
        else 
            begin
            an <= 4'b0111;
            temp <= cnt_s /1000;
            cnt <= cnt + 1;
            end
    end
    assign AN = an;
    BCD7 bcd(temp,cathodes); 
endmodule
