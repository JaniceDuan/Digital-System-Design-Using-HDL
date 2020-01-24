`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/01 14:11:03
// Design Name: 
// Module Name: add
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


module add(input clkn,input [7:0] add1,input [7:0] add2, output [7:0] out );
wire [5:0] add1_2c_f;
wire [5:0] add2_2c_f;
reg [2:0] exp;
reg [3:0] diff;
reg [13:0] shift;
reg [6:0] sum_2c;
reg [6:0] sum;
reg flag_underflow;
initial
flag_underflow = 0;

assign add1_2c_f = (add1[7])? {1'b1,~{1'b1,add1[3:0]}+1}:{2'b01,add1[3:0]};
assign add2_2c_f = (add2[7])? {1'b1,~{1'b1,add2[3:0]}+1}:{2'b01,add2[3:0]};

always @(posedge clkn)
begin
if (!add1[6:0])
    begin
    exp = add2[6:4];
    sum_2c[6] = add2[7];
    sum[4:1] = add2[3:0];
    end
else if (!add2[6:0])
    begin
    exp = add1[6:4];
    sum_2c[6] = add1[7];
    sum[4:1] = add1[3:0];
    end
else if(add2[6:4] == 3'b111 ||  add1[6:4] == 3'b111) 
begin
    exp = 3'b111;
    sum_2c[6] = add1[7];
    sum[4:1] = add1[3:0];
end
else 
begin
if (add1[6:4] > add2[6:4])
begin
    exp = add1[6:4];
    diff = add1[6:4] - add2[6:4];
    shift = {{8{add2_2c_f[5]}},add2_2c_f[5:0]}>>diff;
    sum_2c = {shift[5],shift[5:0]} + {add1_2c_f[5],add1_2c_f};
    sum = sum_2c[6]? {1'b1,~sum_2c[5:0]} + 1 : sum_2c;
   while(!sum[5] && flag_underflow == 0)
    begin
        sum = sum[5:0] << 1;
        exp = exp - 1;
        if (!exp)
            begin
            flag_underflow = 1;
            sum = 0;
            end
    end
    exp = exp + 1;
    flag_underflow = 0;
end
else if (add1[6:4] == add2[6:4])
begin
    exp = add2[6:4];
    sum_2c = {add1_2c_f[5],add1_2c_f} + {add2_2c_f[5],add2_2c_f};
    sum = sum_2c[6]? {1'b1,~sum_2c[5:0]} + 1 : sum_2c;
    
    while(!sum[5] && flag_underflow == 0)
    begin
        sum = sum[5:0] << 1;
        exp = exp - 1;
        if (!exp)
            begin
            flag_underflow = 1;
            sum = 0;
            end
    end
    exp = exp + 1;
    flag_underflow = 0;
end
else
begin
    exp = add2[6:4];
    diff = add2[6:4] - add1[6:4];
    shift = {{8{add1_2c_f[5]}},add1_2c_f[5:0]}>>diff;
    sum_2c = {shift[5],shift[5:0]} + {add2_2c_f[5],add2_2c_f};
    sum = sum_2c[6]? {1'b1,~sum_2c[5:0]} + 1 : sum_2c;
   while(!sum[5] && flag_underflow == 0)
    begin
        sum = sum[5:0] << 1;
        exp = exp - 1;
        if (!exp)
            begin
            flag_underflow = 1;
            sum = 0;
            end
    end
    exp = exp + 1;
    flag_underflow = 0;
end
end

end
assign out[7] = sum_2c[6];
assign out[6:4] = exp;
assign out[3:0] = sum[4:1];
endmodule
