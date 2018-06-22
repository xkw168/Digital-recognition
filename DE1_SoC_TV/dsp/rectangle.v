module rectangle(
clk,
rst,
en, 
iRow,       //边界行
iCol,       //边界列
Row,        //地址行
Col,        //地址列
GRAY2BW,
oBWrgb
);

input clk;
input rst;
input en;
input [19:0] iRow;
input [19:0] iCol;
input [9:0] GRAY2BW;
input [9:0] Row;
input [9:0] Col;

output [9:0] oBWrgb;
reg [9:0] oBWrgb;

always @(posedge clk, negedge rst)
begin
	if(!rst) 
		begin
			oBWrgb <= 10'd0;
		end
	else if(en)
		begin
			//画三行像素点，加宽线
			if(( Row >= iRow[9:0] && Row <= (iRow[9:0] + 3) 
			                      && Col > (iCol[9:0] - 1) 
			                      && Col < (iCol[19:10] + 4)) ||
				(Row <= iRow[19:10] && Row >= (iRow[19:10] - 3) 
				                    && Col > (iCol[9:0] - 1) 
										  && Col < (iCol[19:10] + 4))
			)
				begin
					oBWrgb <= 10'd0;
				end
			else if((Col >= iCol[9:0] && Col <= (iCol[9:0] + 3) 
			                          && Row > (iRow[9:0] + 3) 
											  && Row < (iRow[19:10] - 3))||
				(Col >= iCol[19:10] && Col <= (iCol[19:10] + 3) 
				                    && Row > (iRow[9:0] + 3) 
										  && Row < (iRow[19:10] - 3))
			)
				begin
					oBWrgb <= 10'd0;
				end
			else				
				begin
					oBWrgb = GRAY2BW ;//原样输出
				end 
		end
end
endmodule
