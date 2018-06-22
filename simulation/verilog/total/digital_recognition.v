/*
author: xkw
time: 2018.6.5
*/
module digital_recognition(
	clk,
	rst,
	en,
	iEdge_Row,
	iEdge_Col,
	iRow,
	iCol,
	iBWData,
	oDigital,
	oRecognition,
	fin
);

input clk, rst, en;
input [19:0] iEdge_Row, iEdge_Col;  //输入的边界地址
input [9:0] iRow, iCol;             //输入的行列地址
input [9:0] iBWData;                //输入的二值图像数据

output [3:0] oDigital;				//识别出来的数字
output [5:0] oRecognition;			//识别的交点
wire [5:0] oRecognition;
reg [3:0] oDigital;

output fin;
wire fin;
assign fin = (iRow == 10'd479) && (iCol == 10'd639) && en == 1'd1;

wire [9:0]y;						//二分之一的位置
wire [9:0]x1;						//五分之二的位置
wire [9:0]x2;						//三分之二的位置

assign y = (iEdge_Col[19:10] + iEdge_Col[9:0]) >> 1;
assign x1 = ({(iEdge_Row[19:10] - iEdge_Row[9:0]), 1'b0} / 5) + iEdge_Row[9:0];
assign x2 = ({(iEdge_Row[19:10] - iEdge_Row[9:0]), 1'b0} / 3) + iEdge_Row[9:0];

reg x1_l, x1_r, x2_l, x2_r;			//x1的左右，x2的左右
reg [1:0] y1;
reg [9:0] row1, row2, col1, col2;

always @(posedge clk, negedge rst)
begin
	if(!rst) 
	begin
		x1_l <= 1'b0;
		x1_r <= 1'b0;
		x2_l <= 1'b0;
		x2_r <= 1'b0;
		y1 <= 2'b0;
	end
	else if(en)
	begin
		//在上下边界之间，列数为y
		if ((iRow > iEdge_Row[9:0]) && (iRow < iEdge_Row[19:10]) && (iCol == y))
		begin
			col1 <= iBWData;
			col2 <= col1;
			if((col1 == 10'b0) && (col2 == 10'b11_1111_1111))//前白后黑，一个交点
			begin
				y1 = y1 + 1'b1;
			end
		end
		//列数在y的左边，行数为x1
		else if ((iCol > iEdge_Col[8:0]) && (iCol < y) && (iRow == x1))
		begin
			row1 <= iBWData;
			row2 <= row1;
			if((row1 == 10'b0) && (row2 == 10'b11_1111_1111))//前白后黑，一个交点
			begin
				x1_l = 1'b1;
			end
		end
		//列数在y的右边，行数为x1
		else if ((iCol > y) && (iCol < iEdge_Col[19:10]) && (iRow == x1))		
		begin
			row1 <= iBWData;
			row2 <= row1;
			if((row1 == 10'b0) && (row2 == 10'b11_1111_1111))//前白后黑，一个交点
			begin
				x1_r = 1'b1;
			end
		end
		//列数在y的左边，行数为x2
		else if ((iCol > iEdge_Col[9:0]) && (iCol < y) && (iRow == x2))
		begin
			row1 <= iBWData;
			row2 <= row1;
			if((row1 == 10'b0) && (row2 == 10'b11_1111_1111))//前白后黑，一个交点
			begin
				x2_l = 1'b1;
			end
		end
		//列数在y的右边，行数为x2
		else if ((iCol > y) && (iCol < iEdge_Col[19:10]) && (iRow == x2))		
		begin
			row1 <= iBWData;
			row2 <= row1;
			if((row1 == 10'b0) && (row2 == 10'b11_1111_1111))//前白后黑，一个交点
			begin
				x2_r = 1'b1;
			end
		end
	end
end

assign oRecognition = {y1, x1_l, x1_r, x2_l, x2_r};

always @(posedge clk, negedge rst)
begin
	if(!rst) 
	begin
		oDigital = 4'b1111;//一个不显示的数字
	end
	else
	begin
		case({y1, x1_l, x1_r, x2_l, x2_r})
		6'b10_1111 : oDigital = 4'd0;
		6'b01_1010 : oDigital = 4'd1;//都交在左边
		6'b01_0101 : oDigital = 4'd1;//都交在右边
		6'b11_0110 : oDigital = 4'd2;
		6'b11_0101 : oDigital = 4'd3;
		6'b10_1110 : oDigital = 4'd4;
		6'b11_1001 : oDigital = 4'd5;
		6'b11_1011 : oDigital = 4'd5;//一些特殊情况
		6'b11_1011 : oDigital = 4'd6;
		6'b10_0110 : oDigital = 4'd7;
		6'b11_1111 : oDigital = 4'd8;
		6'b11_1101 : oDigital = 4'd9;
		default : oDigital = 4'b1111;
		endcase
	end
end
endmodule