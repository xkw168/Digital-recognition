`timescale 1ns / 10 ps
module edge_detection_TB;
  reg clk; 
  reg rst; 
  reg ena;
  reg [7:0] DataSource[0:640*480-1];
  reg [9:0] pixel;
  wire [19:0] oRow, oCol;

//读取数据
initial
begin
  
  $readmemh("imgdata5.txt",DataSource);//????
   #20
	$display("0x00: %h",DataSource[8'h00]);
	
end

//地址生成逻辑
reg [9:0]row, col;
reg [1:0]flag;
wire [18:0]address;
wire hscan, vscan;
wire [1:0]edgeDetected;

assign hscan = ((edgeDetected[0] == 1'b0) || (ena == 1'b0)) ? 1'b1 : 1'b0;//加入enable是为了列扫描完之后重新回到行扫描
assign vscan = ((edgeDetected[0] == 1'b1) && (ena == 1'b1)) ? 1'b1 : 1'b0;//一旦确定了上下边界，就停止行扫描改为列扫描
assign enable = (edgeDetected == 2'b11) ? 1'b0 : 1'b1;

//地址生成
always @(posedge clk, negedge rst) 
begin
	if(!rst) 
	begin
		row = 10'b0;
		col = 10'b0;
		flag = 2'b0;
	end
	else if(edgeDetected[0] && !flag[0])//上下边界已确定，下一步变为列扫描
	begin
		row = 10'b0;
		col = 10'b0;
		flag[0] = 1'b1;
	end
	else if(edgeDetected[1] && !flag[1])//上下左右的边界均已确定，可以跳到下一步
	begin
		row = 10'b0;
		col = 10'b0;
		flag[1] = 1'b1;
	end
	else if(hscan)//行扫描且VGA读数据
	begin
		col = col + 1'b1;
		if(col > 10'd639)
		begin
		col = 10'b0;
		row = (row < 10'd479) ? (row + 1'b1) : 1'b0;
		end
	end
	else if(vscan)//列扫描且VGA读数据
	begin
		row = row + 1'b1;
		if(row > 10'd479)
		begin
		row = 1'b0;
		col = (col < 10'd639) ? (col + 1'b1) : 1'b0;
		end
	end
end

assign address = row * 640 + col;//640*480屏幕

//读取数据
always @(negedge clk)
begin
pixel <= (DataSource[address] == 8'hff) ? 10'b11_1111_1111 : 10'd0;
//sobel_out_data[cnt] <= Sobel_Out[9:2] ;
end

always @ (negedge clk)
begin
	if (edgeDetected == 2'b11)
	begin
		$display("row: %d  %d", oRow[19:10], oRow[9:0]);
		$display("col: %d  %d", oCol[19:10], oCol[9:0]);
		
		$display("row: %b  %b", oRow[19:10], oRow[9:0]);
		$display("col: %b  %b", oCol[19:10], oCol[9:0]);
		$stop();
	end
end
  
edge_detection edge_detection_xkw
(
	.clk(clk) ,	// input  clk_sig
	.rst(rst) ,	// input  rst_sig
	.en(ena) ,	// input  en_sig
	.iRow(row) ,	// input [8:0] iRow_sig
	.iCol(col) ,	// input [8:0] iCol_sig
	.iHscan(hscan) ,	// input  iHscan_sig
	.iVscan(vscan) ,	// input  iVscan_sig
	.dataBW(pixel) ,	// input [9:0] dataBW_sig
	.oRow(oRow) ,	// output [17:0] oRow_sig
	.oCol(oCol) ,	// output [17:0] oCol_sig
	.ofinish(edgeDetected) 	// output [1:0] ofinish_sig
);


initial begin  clk = 1'b0;  rst = 1'b0;  ena = 1'b1;   #20   rst = 1'b1; end

always #30 clk = ~clk;

   
endmodule
