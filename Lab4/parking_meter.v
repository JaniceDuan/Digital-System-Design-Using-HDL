`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/09/22 22:40:55
// Design Name: 
// Module Name: parking_meter
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


module parking_meter(input sysclk,input U, input L, input R ,input D,input[1:0] sw, output[7:0] cathodes,output[3:0] AN
,output[15:0] cnt_s1);


    reg [15:0] cnt_s;
    assign cnt_s1 = cnt_s[15:0];
    
    wire U_o;
    wire L_o;
    wire R_o;
    wire D_o;
    wire [1:0]sw_o;
    wire clk_1hz;
    wire clk_20hz;
    wire clk_1khz;
    initial 
    begin
    cnt_s = 0;
    end
    
   
    get_1hz get_1hz1(sysclk, clk_1hz);
    get_20hz get_20hz1(sysclk, clk_20hz);
    get_1khz get_1khz1(sysclk, clk_1khz);
    debounce debounce1(clk_20hz,U,U_o);
    debounce debounce2(clk_20hz,L,L_o);
    debounce debounce3(clk_20hz,R,R_o);
    debounce debounce4(clk_20hz,D,D_o);
    debounce_s debounce_s1(clk_20hz,sw[0],sw_o[0]);
    debounce_s debounce_s2(clk_20hz,sw[1],sw_o[1]);
    always @(posedge clk_1hz or posedge U_o or posedge L_o or posedge R_o or posedge D_o 
    or posedge sw_o[0] or posedge sw_o[1] )
    begin
    if (sw_o[0])
        cnt_s = 10;
    else if (sw_o[1])
        cnt_s = 205;
    else 
    begin
    if (U_o)
        begin
           
            cnt_s = cnt_s + 10;
    //        if (cnt_s > 9999)
    //            cnt_s = 9999;
           
           
        end
    else if (L_o)
        begin
            
            cnt_s = cnt_s + 180;
     //       if (cnt_s > 9999)
     //          cnt_s = 9999;
          
        end
    else if (R_o)
        begin
           
            cnt_s = cnt_s + 200;
    //        if (cnt_s > 9999)
    //            cnt_s = 9999;
           
        end
    else if (D_o)
        begin
            
            cnt_s = cnt_s + 550;
    //       if (cnt_s > 9999)
    //            cnt_s = 9999;
           
        end
    else
    if (cnt_s > 0)
        cnt_s = cnt_s - 1;
    else 
        cnt_s = cnt_s;
    end
    end
    show show1( cnt_s, clk_1khz,cathodes, AN);
    
    
endmodule
