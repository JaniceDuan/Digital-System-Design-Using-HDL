module VGA_controll(CLK,switch,hsync,vsync,vgaRed,vgaGreen,vgaBlue);
input CLK;
input [7:0]switch;
output reg hsync;
output reg vsync;
output reg [3:0]vgaRed;
output reg [3:0]vgaGreen;
output reg [3:0]vgaBlue;

wire pixel_clk;
wire h_visable;
wire v_visable;
wire hsync_m;
wire vsync_m;
wire [3:0]R;
wire [3:0]G;
wire [3:0]B;

always @(posedge pixel_clk)
begin
    vgaRed <= R;
    vgaGreen <= G;
    vgaBlue <= B;
    hsync <= hsync_m;
    vsync <= vsync_m;
end
clock_divider div(CLK,pixel_clk);
hv_counter coun(pixel_clk,hsync_m,vsync_m,h_visable,v_visable);
RGB_display dis(switch,h_visable,v_visable,R,G,B);

endmodule