`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/22 23:01:56
// Design Name: 
// Module Name: sparkling
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


module sparkling(input [31:0] cnt_s, input clk_1khz, output en );
    reg en1;
    reg [10:0] cnt;
    assign en = en1;
    initial 
    begin
    en1 = 1;
    cnt = 0;
    end
    
    always @(posedge clk_1khz)
    if (cnt_s == 0)
        begin
        cnt = cnt + 1;
        if (cnt == 500)
            begin
            en1 = ~en1;
            cnt = 0;
            end
        end
    else if (cnt_s <= 200 && cnt_s > 0)  
        begin
        cnt = cnt + 1;
        if (cnt == 1000)
            begin
            en1 = ~en1;
            cnt = 0;
            end
        end
    else 
        en1 = 1;
endmodule
