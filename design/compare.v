
`timescale 1ns/1ps

module compare(
	input i_clk,
	input i_rst_n,
	input [7:0] i_com1, i_com2, i_com3,i_com4,i_com5, i_com6, i_com7,i_com8,i_com9,i_com10,
	output[7:0] o_max1, o_max2, o_max3, o_max4, o_max5, o_max6, o_max7, o_max8,o_max9, o_max10
    );

reg[7:0] fcom1, fcom2, fcom3, fcom4, fcom5, fcom6, fcom7, fcom8, fcom9, fcom10; 
reg[7:0] max1, max2, max3, max4, max5, max6, max7, max8, max9, max10;
reg[3:0] cnt;
reg flag;

//////////////////////////////////////////////////

always @(posedge i_clk)	begin
	if(!i_rst_n) begin
	flag <= 0;
	fcom1 <= 0;
	fcom2 <= 0;
	fcom3 <= 0;
	fcom4 <= 0;
	fcom5 <= 0;
	fcom6 <= 0;
	fcom7 <= 0;
	fcom8 <= 0;
	fcom9 <= 0;
	fcom10 <= 0;
	end
	else if((fcom1 != i_com1)||(fcom2 != i_com2)||(fcom3 != i_com3)||(fcom4 != i_com4)||(fcom5 != i_com5)||(fcom6 != i_com6)||(fcom7 != i_com7)||(fcom8 != i_com8)||(fcom9 != i_com9)||(fcom10 != i_com10)) begin
	flag <= 1;
	fcom1 <= i_com1;
	fcom2 <= i_com2;
	fcom3 <= i_com3;
	fcom4 <= i_com4;
	fcom5 <= i_com5;
	fcom6 <= i_com6;
	fcom7 <= i_com7;
	fcom8 <= i_com8;
	fcom9 <= i_com9;
	fcom10 <= i_com10;
	end
	else flag <= 0;
end

//////////////////////////////////////////////

always @(posedge i_clk)	begin
	if(!i_rst_n) begin
	max1 <= 'd0;
	max2 <= 'd0;
	max3 <= 'd0;
	max4 <= 'd0;
	max5 <= 'd0;
	max6 <= 'd0;
	max7 <= 'd0;
	max8 <= 'd0;
	max9 <= 'd0;
	max10 <= 'd0;
	
	cnt <= 'd0;
	end
	
	else if(flag) begin
	max1 <= i_com1;
	max2 <= i_com2;
	max3 <= i_com3;
	max4 <= i_com4;
	max5 <= i_com5;
	max6 <= i_com6;
	max7 <= i_com7;
	max8 <= i_com8;
	max9 <= i_com9;
	max10 <= i_com10;
	
	cnt <=  'd1;
	end
end

//////////////////////////////////////////////

always @(posedge i_clk)	begin
	if(!i_rst_n || (cnt != 'd1)) begin

	end
	
	else if(max1 > max2) begin
	max1 <= max1;
	max2 <= max2;
	cnt <= cnt + 'b1;
	end
	
	else begin
	max1 <= max2;
	max2 <= max1;
	cnt <= cnt + 'b1;
	end
end

always @(posedge i_clk)	begin
	if(!i_rst_n || (cnt != 'd2)) begin

	end
	
	else if(max2 > max3) begin
	max2 <= max2;
	max3 <= max3;
	cnt <= cnt + 'b1;
	end

	else begin
	max2 <= max3;
	max3 <= max2;
	cnt <= cnt + 'b1;
	end	
end

always @(posedge i_clk)	begin
	if(!i_rst_n || (cnt != 'd3)) begin

	end
	
	else if(max3 > max4) begin
	max3 <= max3;
	max4 <= max4;
	cnt <= cnt + 'b1;
	end

	else begin
	max3 <= max4;
	max4 <= max3;
	cnt <= cnt + 'b1;
	end
end

always @(posedge i_clk)	begin
	if(!i_rst_n || (cnt != 'd4)) begin

	end
	
	else if(max4 > max5) begin
	max4 <= max4;
	max5 <= max5;
	cnt <= cnt + 'b1;
	end

	else begin
	max4 <= max5;
	max5 <= max4;
	cnt <= cnt + 'b1;
	end
end

always @(posedge i_clk)	begin
	if(!i_rst_n || (cnt != 'd5)) begin

	end
	
	else if(max5 > max6) begin
	max5 <= max5;
	max6 <= max6;
	cnt <= cnt + 'b1;
	end

	else begin
	max5 <= max6;
	max6 <= max5;
	cnt <= cnt + 'b1;
	end
end

always @(posedge i_clk)	begin
	if(!i_rst_n || (cnt != 'd6)) begin

	end
	
	else if(max6 > max7) begin
	max6 <= max6;
	max7 <= max7;
	cnt <= cnt + 'b1;
	end

	else begin
	max6 <= max7;
	max7 <= max6;
	cnt <= cnt + 'b1;
	end
end

always @(posedge i_clk)	begin
	if(!i_rst_n || (cnt != 'd7)) begin

	end
	
	else if(max7 > max8) begin
	max7 <= max7;
	max8 <= max8;
	cnt <= cnt + 'b1;
	end

	else begin
	max7 <= max8;
	max8 <= max7;
	cnt <= cnt + 'b1;
	end
end

always @(posedge i_clk)	begin
	if(!i_rst_n || (cnt != 'd8)) begin

	end
	
	else if(max8 > max9) begin
	max8 <= max8;
	max9 <= max9;
	cnt <= cnt + 'b1;
	end

	else begin
	max8 <= max9;
	max9 <= max8;
	cnt <= cnt + 'b1;
	end
end

always @(posedge i_clk)	begin
	if(!i_rst_n || (cnt != 'd9)) begin

	end
	
	else if(max9 > max10) begin
	max9 <= max9;
	max10 <= max10;
	cnt <= 'd1;
	end

	else begin
	max9 <= max10;
	max10 <= max9;
	cnt <= 'd1;
	end
end


assign o_max1=max1;
assign o_max2=max2;
assign o_max3=max3;
assign o_max4=max4;
assign o_max5=max5;
assign o_max6=max6;
assign o_max7=max7;
assign o_max8=max8;
assign o_max9=max9;
assign o_max10=max10;

endmodule