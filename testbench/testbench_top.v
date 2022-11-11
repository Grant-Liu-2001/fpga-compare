
`timescale 1ns/1ps

module testbench_top();
	
////////////////////////////////////////////////////////////
//��������

`define CLK_PERIORD		10		//ʱ����������Ϊ10ns��100MHz��	

////////////////////////////////////////////////////////////
//�ӿ�����
	
reg clk;
reg rst_n;
reg[7:0] i_com1, i_com2, i_com3, i_com4, i_com5, i_com6, i_com7, i_com8, i_com9, i_com10;
wire[7:0] o_max1, o_max2, o_max3, o_max4, o_max5, o_max6, o_max7, o_max8, o_max9, o_max10;

////////////////////////////////////////////////////////////	
//�Ա����Ե���ƽ�������
	
	
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
//��λ��ʱ�Ӳ���

	//ʱ�Ӻ͸�λ��ʼ������λ����
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
	
	//ʱ�Ӳ���
always #(`CLK_PERIORD/2) clk = ~clk;	

////////////////////////////////////////////////////////////
//���Լ�������

initial begin
	
	@(posedge rst_n);	//�ȴ���λ���
	
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






