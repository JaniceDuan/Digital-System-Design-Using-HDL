module test_counter;

reg pixel_clk;
wire hsync,vsync;
wire h_visable,v_visable;
wire [9:0]hcount;
wire [9:0]vcount;

hv_counter uut(pixel_clk,hsync,vsync,h_visable,v_visable,hcount,vcount);

initial begin
pixel_clk = 0;
end

always #5 pixel_clk = ~pixel_clk;

endmodule