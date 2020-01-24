module RGB_display(hcount,vcount,h_visable,v_visable,black,snake_x1,snake_y1,snake_x2,snake_y2,snake_x3,snake_y3,snake_x4,snake_y4,R,G,B);

input h_visable;
input v_visable;
output [3:0]R;
output [3:0]G;
output [3:0]B;
input [9:0]hcount;
input [9:0]vcount;
input black;
input [9:0]snake_x1;
input [9:0]snake_y1;
input [9:0]snake_x2;
input [9:0]snake_y2;
input [9:0]snake_x3;
input [9:0]snake_y3;
input [9:0]snake_x4;
input [9:0]snake_y4;

reg [3:0]R_m;
reg [3:0]G_m;
reg [3:0]B_m;

always @(*) begin
    if (black)
    begin
    R_m <= 0;
	G_m <= 0;
	B_m <= 0;
    end
    else
    begin
	if (((snake_x1 - 5 <= hcount && hcount <= snake_x1 + 5) && (snake_y1 - 5 <= vcount && vcount <= snake_y1 + 5)) || ((snake_x2 - 5 <= hcount && hcount <= snake_x2 + 5) && (snake_y2 - 5 <= vcount && vcount <= snake_y2 + 5)) || ((snake_x3 - 5 <= hcount && hcount <= snake_x3 + 5) && (snake_y3 - 5 <= vcount && vcount <= snake_y3 + 5)) || ((snake_x4 - 5 <= hcount && hcount <= snake_x4 + 5) && (snake_y4 - 5 <= vcount && vcount <= snake_y4 + 5)))
	           begin
	           R_m <= 0;
	           G_m <= 0;
	           B_m <= 15;
	           end
	else 
	begin
	R_m <= 15;
	G_m <= 15;
	B_m <= 15;
	end
	end
end

assign R = ((h_visable == 1)&&(v_visable == 1))? R_m:0;
assign G = ((h_visable == 1)&&(v_visable == 1))? G_m:0;
assign B = ((h_visable == 1)&&(v_visable == 1))? B_m:0;

endmodule