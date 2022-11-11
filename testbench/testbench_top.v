
`timescale 1ns/1ps

module testbench_top();
	
////////////////////////////////////////////////////////////
//参数定义

`define CLK_PERIORD		10		//时钟周期设置为10ns（100MHz）	

////////////////////////////////////////////////////////////
//接口申明
	
reg clk;
reg rst_n;
reg[7:0] i_com1, i_com2, i_com3, i_com4, i_com5, i_com6, i_com7, i_com8, i_com9, i_com10;
wire[7:0] o_max1, o_max2, o_max3, o_max4, o_max5, o_max6, o_max7, o_max8, o_max9, o_max10;

////////////////////////////////////////////////////////////	
//对被测试的设计进行例化
	
	
compare		Compare(
	.i_clk(clk),
	.i_rst_n(rst_n),
	.i_com1(i_com1),
	.i_com2(i_com2),
	.i_com3(i_com3),
	.i_com4(i_com4),
	.i_com5(i_com5),
	.i_com6(i_com6),
	.i_com7(i_com7),
	.i_com8(i_com8),
	.i_com9(i_com9),
	.i_com10(i_com10),
	.o_max1(o_max1),
	.o_max2(o_max2),
	.o_max3(o_max3),
	.o_max4(o_max4),
	.o_max5(o_max5),
	.o_max6(o_max6),
	.o_max7(o_max7),
	.o_max8(o_max8),
	.o_max9(o_max9),
	.o_max10(o_max10)

    );	
////////////////////////////////////////////////////////////
//复位和时钟产生

	//时钟和复位初始化、复位产生
initial begin
	clk <= 0;
	rst_n <= 0;
	
	i_com1 <= 'd0;
	i_com2 <= 'd0;
	i_com3 <= 'd0;
	i_com4 <= 'd0;
	i_com5 <= 'd0;
	i_com6 <= 'd0;
	i_com7 <= 'd0;
	i_com8 <= 'd0;
	i_com9 <= 'd0;
	i_com10 <= 'd0;
	
	
	#1000;
	rst_n <= 1;
	
	
end
	
	//时钟产生
always #(`CLK_PERIORD/2) clk = ~clk;	

////////////////////////////////////////////////////////////
//测试激励产生

initial begin
	
	@(posedge rst_n);	//等待复位完成
	
	@(posedge clk);
	
	i_com1 <= 'd1;
	i_com2 <= 'd2;
	i_com3 <= 'd3;
	i_com4 <= 'd4;
	i_com5 <= 'd5;
	i_com6 <= 'd6;
	i_com7 <= 'd7;
	i_com8 <= 'd8;
	i_com9 <= 'd9;
	i_com10 <= 'd10;
	
	repeat(15) begin
		@(posedge clk);
	end
	
	/* i_com1 <= 'd7;
	i_com2 <= 'd5;
	i_com3 <= 'd6;
	i_com4 <= 'd8;
	
	repeat(15) begin
		@(posedge clk);
	end
	
	i_com1 <= 'd5;
	i_com2 <= 'd5;
	i_com3 <= 'd5;
	i_com4 <= 'd6; */
	
	#1_000;
	$stop;
end


endmodule






