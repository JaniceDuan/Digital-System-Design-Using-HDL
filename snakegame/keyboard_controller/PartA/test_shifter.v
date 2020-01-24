module test_shifter22;
reg ps2clk;
reg data;
wire [21:0]Q;
wire [7:0]keycode;
wire detect;
wire idle;

shifter22 uut(ps2clk,data,Q,keycode,detect,idle);

initial begin
ps2clk = 1;
data = 0;
#12 data = 0;
#10 data = 0;
#10 data = 0;
#10 data = 0;
#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 0;
#10 data = 1;
#10 data = 0;
#10 data = 0;
#10 data = 0;
#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 0;
#10 data = 0;
#10 data = 0;
#10 data = 1;
#10 data = 1;
end




always #5 ps2clk = ~ps2clk;

endmodule