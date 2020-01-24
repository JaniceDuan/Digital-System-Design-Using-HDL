module hv_counter(pixel_clk,hsync,vsync,h_visable,v_visable,hcount,vcount);
input pixel_clk;
output hsync,vsync;
output h_visable,v_visable;
output hcount,vcount;

reg[9:0]hcount;
reg[9:0]vcount;

initial begin
hcount = 0;
vcount = 0;
end

always @(posedge pixel_clk)
begin
	if (hcount < 799) begin
		hcount = hcount +1;
	end
	else begin 
		if (vcount < 524) begin
			hcount = 0;
			vcount = vcount + 1;
		end
		else begin
			vcount = 0;
			hcount = 0;
		end
	end
end

assign hsync = ((hcount < 659)||(hcount > 755))? 1:0;
assign vsync = ((vcount == 493)||(vcount == 494))? 0:1;

assign h_visable = (hcount < 640)? 1:0;
assign v_visable = (vcount < 480)? 1:0;

endmodule
