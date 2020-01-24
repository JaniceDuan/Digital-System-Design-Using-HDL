module RGB_display(switch,h_visable,v_visable,R,G,B);
input [7:0]switch;
input h_visable;
input v_visable;
output [3:0]R;
output [3:0]G;
output [3:0]B;

reg [3:0]R_m;
reg [3:0]G_m;
reg [3:0]B_m;

always @(switch[0],switch[1],switch[2],switch[3],switch[4],switch[5],switch[6],switch[7]) begin
	if (switch[0] == 1) begin
		R_m <= 0;
		G_m <= 0;
		B_m <= 0;
	end
	else if(switch[1] == 1) begin
		R_m <= 0;
		G_m <= 0;
		B_m <= 15;
	end
	else if(switch[2] == 1) begin
		R_m <= 8;
		G_m <= 4;
		B_m <= 1;
	end
	else if(switch[3] == 1) begin
		R_m <= 0;
		G_m <= 8;
		B_m <= 8;
	end
	else if(switch[4] == 1) begin
		R_m <= 15;
		G_m <= 0;
		B_m <= 0;
	end
	else if(switch[5] == 1) begin
		R_m <= 8;
		G_m <= 0;
		B_m <= 8;
	end
	else if(switch[6] == 1) begin
		R_m <= 15;
		G_m <= 15;
		B_m <= 0;
	end
	else if(switch[7] == 1) begin
		R_m <= 15;
		G_m <= 15;
		B_m <= 15;
	end
	else begin
		R_m <= 0;
        G_m <= 0;
        B_m <= 0;
    end
end

assign R = ((h_visable == 1)&&(v_visable == 1))? R_m:0;
assign G = ((h_visable == 1)&&(v_visable == 1))? G_m:0;
assign B = ((h_visable == 1)&&(v_visable == 1))? B_m:0;

endmodule