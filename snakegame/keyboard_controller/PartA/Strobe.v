//`define endflash 10//10000000

module Strobe(CLK,detect,newkeyStrobe);
input CLK;
input detect;
output reg newkeyStrobe;

reg [23:0]count;
reg lock;


initial begin
	newkeyStrobe = 0;
	count = 0;
	lock = 0;
end

always @(posedge CLK)
begin
	if (detect&!lock) begin
		count <= 10000000;
		newkeyStrobe <= 0;
		lock <= 1;
	end
	else if (detect&lock) begin
		if (count >0) begin
			count<=count-1;
			newkeyStrobe <= 1;
			lock <= 1;
		end
		else begin
			
			newkeyStrobe <= 0;
			lock <= 1;
		end
	end
	else begin
		count <= 0;
		newkeyStrobe <= 0;
		lock <= 0;
	end
end
	
endmodule