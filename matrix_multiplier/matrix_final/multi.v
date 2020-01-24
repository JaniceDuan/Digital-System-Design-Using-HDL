module multi(/*input [7:0] multi1,input [7:0] multi2,*/output [7:0] out);
reg [3:0] exp;
reg [9:0] result;
reg sign;

wire [7:0] multi1 = 8'b00101000;
wire [7:0] multi2 = 8'b00010100;
always @(*)
begin
    if(!multi1[6:0] || !multi2[6:0]) 
    begin
        sign = 0;
        exp = 0;
        result = 10'b0000000000;
    end
    else if(multi1[6:4] == 3'b111 || multi2[6:4] == 3'b111) 
    begin
        sign = 0;
        exp = 3'b111;
        result = 10'b0000000000;
    end
    else
    begin
    sign = multi1[7] ^ multi2[7];
    exp = {1'b0,multi1[6:4]} + {1'b0,multi2[6:4]} - 3;
    result = {6'b000001,multi1[3:0]} * {6'b000001,multi2[3:0]};
    while (result[9])
    begin
        result = result >> 1;
        exp = exp + 1;
    end
    end

    end
assign out[7] = sign;
assign out[6:4] = exp[2:0];
assign out[3:0] = result[7:4];
endmodule
