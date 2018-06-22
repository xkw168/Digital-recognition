`timescale 1ns / 10 ps
module total_TB;
  reg clk; 
  reg rst; 
  wire ena;
  reg [7:0] DataSource[0:640*480-1];
  reg [7:0] outData[0:640*480-1];
  reg [9:0] pixel;
  wire [19:0] oRow, oCol;
  wire [9:0]oBWrgb;
  integer save_picture;
  integer i;
  wire [5:0] out;
  wire fin;

//读取数据
initial
begin
  
  $readmemh("imgdata9.txt", DataSource);//????
   #20
	$display("0x00: %h",DataSource[8'h00]);
	
end

//地址生成逻辑
reg [9:0]row, col;
reg [1:0]flag;
wire [18:0]address;
wire hscan, vscan;
wire [1:0]edgeDetected;
wire en_recogintion;

assign hscan = ((edgeDetected[0] == 1'b0) || (ena == 1'b0)) ? 1'b1 : 1'b0;//加入enable是为了列扫描完之后重新回到行扫描
assign vscan = ((edgeDetected[0] == 1'b1) && (ena == 1'b1)) ? 1'b1 : 1'b0;//一旦确定了上下边界，就停止行扫描改为列扫描
assign ena = (edgeDetected == 2'b11) ? 1'b0 : 1'b1;
assign en_recogintion = ~ena;

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
	if(en_recogintion)
	begin
		outData[address] <= oBWrgb;
	end
//sobel_out_data[cnt] <= Sobel_Out[9:2] ;
end

always @ (negedge clk)
begin
	if (fin)
	begin
		$display("row: %d  %d", oRow[19:10], oRow[9:0]);
		$display("col: %d  %d", oCol[19:10], oCol[9:0]);
		
		$display("result: %h", oDigital);
		$display("result: %b", out);
		
		save_picture=$fopen("savedata.txt");
		for(i = 2; i < 640*480; i = i + 1)
		begin
			#1 
			//$display(DataSource[i]);
			$fdisplay(save_picture,"%h",outData[i]);
		end
		$fclose(save_picture);
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

//根据确定的上下左右边界画矩形框
rectangle rectangle_inst
(
	.clk(clk) ,	// input  clk_sig
	.rst(rst) ,	// input  rst_sig
	.en(en_recogintion) ,	// input  en_sig
	.iRow(oRow) ,	// input [19:0] iRow_sig
	.iCol(oCol) ,	// input [19:0] iCol_sig
	.Row(row) ,	// input [9:0] Row_sig
	.Col(col) ,	// input [9:0] Col_sig
	.GRAY2BW(pixel) ,	// input [9:0] GRAY2BW_sig
	.oBWrgb(oBWrgb) 	// output [9:0] oBWrgb_sig
);

wire [3:0] oDigital;

//根据确定的上下左右边界识别数字
digital_recognition digital_recognition_xkw
(
	.clk(clk) ,	// input  clk_sig
	.rst(rst) ,	// input  rst_sig
	.en(en_recogintion) ,	// input  en_sig
	.iEdge_Row(oRow) ,	// input [17:0] iEdge_Row_sig
	.iEdge_Col(oCol) ,	// input [17:0] iEdge_Col_sig
	.iRow(row) ,	// input [8:0] iRow_sig
	.iCol(col) ,	// input [8:0] iCol_sig
	.iBWData(pixel) ,	// input  iBWData_sig
	.oDigital(oDigital), 	// output [3:0] oDigital_sig
	.oRecognition(out),
	.fin(fin)
);

//ena = 1'b1;
initial begin  clk = 1'b0;  rst = 1'b0;     #20   rst = 1'b1; end

always #30 clk = ~clk;

   
endmodule
