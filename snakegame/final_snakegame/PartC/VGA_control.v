module VGA_controll(CLK,ps2clk,data,hsync,vsync,vgaRed,vgaGreen,vgaBlue,an,seg,newkeyStrobe,state,keycode_o);
input CLK;
input ps2clk;
input data;

output [2:0]state;
assign state = snake.state;
output [7:0]keycode_o;
assign keycode_o = key.keycode;

output reg hsync;
output reg vsync;
output reg [3:0]vgaRed;
output reg [3:0]vgaGreen;
output reg [3:0]vgaBlue;
output [3:0]an;
output [6:0]seg;
output newkeyStrobe;
wire pixel_clk;
wire h_visable;
wire v_visable;
wire hsync_m;
wire vsync_m;
wire [3:0]R;
wire [3:0]G;
wire [3:0]B;
wire [9:0]hcount;
wire [9:0]vcount;
wire black;
wire [9:0]snake_x1;
wire [9:0]snake_y1;
wire [9:0]snake_x2;
wire [9:0]snake_y2;
wire [9:0]snake_x3;
wire [9:0]snake_y3;
wire [9:0]snake_x4;
wire [9:0]snake_y4;
wire clk_5hz;
wire [7:0] keycode;
assign keycode = key.keycode;

always @(posedge pixel_clk)
begin
    vgaRed <= R;
    vgaGreen <= G;
    vgaBlue <= B;
    hsync <= hsync_m;
    vsync <= vsync_m;
end

keyboard_design key(CLK,ps2clk,data,an,seg,newkeyStrobe);
clock_divider div(CLK,pixel_clk);
clk_5Hz clk5(CLK,clk_5hz);
hv_counter coun(pixel_clk,hsync_m,vsync_m,h_visable,v_visable,hcount,vcount);
RGB_display dis(hcount,vcount,h_visable,v_visable,black,snake_x1,snake_y1,snake_x2,snake_y2,snake_x3,snake_y3,snake_x4,snake_y4,R,G,B);
snakegame snake(CLK,clk_5hz,keycode,newkeyStrobe,black,snake_x1,snake_y1,snake_x2,snake_y2,snake_x3,snake_y3,snake_x4,snake_y4);
endmodule