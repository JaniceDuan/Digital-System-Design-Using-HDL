module shifter22(ps2clk,data,Q,keycode,detect,idle);
input ps2clk;
input data;
output reg[21:0]Q;
output reg[7:0]keycode;
output reg detect;
output reg idle;


initial begin
Q = 22'b1000000000000000000000;
keycode = 0;
detect = 0;
idle = 1;
end

always @(negedge ps2clk)
    begin
		Q = {data,Q[21:1]};
		if (Q[8:0] == 9'b111100000)
		begin
			keycode <= Q[19:12];
            detect <= 1;
			idle <= 0;
		end
		else begin
			keycode <= keycode;
			detect <= 0;
			idle <= 1;
		end
	end
	
//assign detect = (Q[8:1] == 8'hF0) ? 0 : 1;

endmodule
