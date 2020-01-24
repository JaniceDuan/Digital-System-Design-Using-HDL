module snakegame(CLK,clk_snake,keycode,newkeyStrobe,black,snake_x1,snake_y1,snake_x2,snake_y2,snake_x3,snake_y3,snake_x4,snake_y4);

input CLK;
input clk_snake;
input newkeyStrobe;
input [7:0] keycode;
output reg black;
output reg [9:0]snake_x1;
output reg [9:0]snake_y1;
output reg [9:0]snake_x2;
output reg [9:0]snake_y2;
output reg [9:0]snake_x3;
output reg [9:0]snake_y3;
output reg [9:0]snake_x4;
output reg [9:0]snake_y4;

reg [2:0]state;
reg [1:0]direction;
reg flag_play;
reg flag_gameover;
wire [7:0] keycode_s;

parameter exit = 3'b000;
parameter play = 3'b001;
parameter pause = 3'b010;
parameter gameover = 3'b011;
parameter restart = 3'b100;
//parameter restart = 3'b100;

parameter [7:0]Esc = 8'h76;
parameter [7:0]S = 8'h1B;
parameter [7:0]R = 8'h2D;
parameter [7:0]P = 8'h4D;
parameter [7:0]up_key = 8'h43;
parameter [7:0]down_key = 8'h42;
parameter [7:0]left_key = 8'h3B;
parameter [7:0]right_key = 8'h4B;
parameter [1:0]right = 2'b00;
parameter [1:0]left = 2'b01;
parameter [1:0]up = 2'b10;
parameter [1:0]down = 2'b11; 

initial begin
state = exit;
direction = right;
flag_play = 0;
flag_gameover = 0;
end
assign keycode_s = keycode & {8{newkeyStrobe}}; 

always @(posedge newkeyStrobe or posedge flag_play or posedge flag_gameover) begin
	if (flag_gameover == 1)
	   begin
	   if (keycode_s == S)
           state = restart;
	   else if (keycode_s == Esc)
	       state = exit; 
	   else 
	       state = gameover; 
	   end	  
	else if (flag_play == 1 || state == pause && keycode == R)
        state = play;
	else if (keycode == S)
        state = restart;
    else if (keycode == Esc)
        state = exit;
	else if (keycode == P)
	   state = pause;
end

always @(posedge clk_snake) 
begin
	if (state == restart) 
	begin
	    flag_gameover = 0;
	    black = 0;
		snake_x1 = 15;
        snake_y1 = 235; //actual value?
        snake_x2 = 0;
        snake_y2 = 0;
        snake_x3 = 0;
        snake_y3 = 0;
        snake_x4 = 0;
        snake_y4 = 0;
		direction = right;
		flag_play = 1;
	end
	else if (state == pause ||state == gameover ) 
	begin
	    flag_play <= 0;
	    black <= 0; 
		snake_x1 <= snake_x1;
		snake_y1 <= snake_y1;
	end
	else if(state == exit) 
	begin
	    flag_gameover <= 0;
		black <= 1;
		flag_play <= 0;
	end
	else if (state == play) 
	begin
	    flag_play <= 0;
	    black <= 0; 
		if (direction == right) 
		begin
			if (keycode == down_key) 
			begin
				snake_y1 <= snake_y1 + 10;
				snake_x2 <= snake_x1;
				snake_x3 <= snake_x2;
				snake_x4 <= snake_x3;
				direction <= down;
				if (snake_y1 >= 475) flag_gameover = 1;
			end
			else if (keycode == up_key) 
			begin
				snake_y1 <= snake_y1 - 10;
				snake_x2 <= snake_x1;
				snake_x3 <= snake_x2;
				snake_x4 <= snake_x3;
				direction <= up;
				if (snake_y1 <= 5) flag_gameover = 1;
			end
			else 
			begin
				snake_x1 <= snake_x1 + 10;
				snake_x2 <= snake_x1;
				snake_x3 <= snake_x2;
				snake_x4 <= snake_x3;
				snake_y2 <= snake_y1;
				snake_y3 <= snake_y2;
				snake_y4 <= snake_y3;
				if (snake_x1 >= 635) flag_gameover = 1;
			end
		end
		
		else if (direction == left)
		begin
			if(keycode == up_key) 
			begin
				snake_y1 <= snake_y1 - 10;
				snake_x2 <= snake_x1;
				snake_x3 <= snake_x2;
				snake_x4 <= snake_x3;
				direction <= up;
				if (snake_y1 <= 5) flag_gameover = 1;
			end
			else if(keycode == down_key) 
			begin
				snake_y1 <= snake_y1 + 10;
				snake_x2 <= snake_x1;
				snake_x3 <= snake_x2;
				snake_x4 <= snake_x3;
				direction <= down;
				if (snake_y1 >= 475) flag_gameover = 1;
	        end
			else 
			begin
				snake_x1 <= snake_x1 - 10;
				snake_x2 <= snake_x1;
				snake_x3 <= snake_x2;
				snake_x4 <= snake_x3;
				snake_y2 <= snake_y1;
				snake_y3 <= snake_y2;
				snake_y4 <= snake_y3;
				if (snake_x1 <= 5) flag_gameover = 1;
		    end
		end
			
		else if (direction == up) 
		begin
			if (keycode == left_key) 
			begin
				snake_x1 <= snake_x1 - 10;
				snake_y2 <= snake_y1;
				snake_y3 <= snake_y2;
				snake_y4 <= snake_y3;
				direction <= left;
				if (snake_x1 <= 5) flag_gameover = 1;
			end
			else if (keycode == right_key) 
			begin
				snake_x1 <= snake_x1 + 10;
				snake_y2 <= snake_y1;
				snake_y3 <= snake_y2;
				snake_y4 <= snake_y3;
				direction <= right;
				if (snake_x1 >= 635) flag_gameover = 1;
			end
			else 
			begin
				snake_y1 <= snake_y1 - 10;
				snake_y2 <= snake_y1;
				snake_y3 <= snake_y2;
				snake_y4 <= snake_y3;
				snake_x2 <= snake_x1;
				snake_x3 <= snake_x2;
				snake_x4 <= snake_x3;
				if (snake_y1 <= 5) flag_gameover = 1;
			end
		end
			
		else if (direction == down) 
		begin
			if (keycode == left_key) 
			begin
				snake_x1 <= snake_x1 - 10;
				snake_y2 <= snake_y1;
				snake_y3 <= snake_y2;
				snake_y4 <= snake_y3;
				direction <= left;
				if (snake_x1 <= 5) flag_gameover = 1;
			end
			else if (keycode == right_key)
			begin
				snake_x1 <= snake_x1 + 10;
				snake_y2 <= snake_y1;
				snake_y3 <= snake_y2;
				snake_y4 <= snake_y3;
				direction <= right;
				if (snake_x1 >= 635) flag_gameover = 1;
			end
			else 
			begin
				snake_y1 <= snake_y1 + 10;
				snake_y2 <= snake_y1;
				snake_y3 <= snake_y2;
				snake_y4 <= snake_y3;
				snake_x2 <= snake_x1;
				snake_x3 <= snake_x2;
				snake_x4 <= snake_x3;
				if (snake_y1 >= 475) flag_gameover = 1;
			end
		end
	end
end
	
endmodule
