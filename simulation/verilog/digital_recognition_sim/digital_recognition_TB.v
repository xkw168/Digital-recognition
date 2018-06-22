`timescale 1ns / 10 ps
module digital_recognition_TB;
  reg clk; 
  reg rst; 
  reg ena;
  reg [7:0] DataSource[0 : 640*480-1];
  reg [9:0] pixel;

//读取数据
initial
begin
  
  $readmemh("imgdata9.txt",DataSource);//????
   #20
	$display("0x00: %h",DataSource[8'h00]);
	
end

//地址生成逻辑
reg [9:0]row, col;
wire [18:0]address;

//地址生成
always @(posedge clk, negedge rst) 
begin
	if(!rst) 
	begin
		row = 10'b0;
		col = 10'b0;
	end
	else
	begin
		col = col + 1'b1;
		if(col > 10'd639)
		begin
		col = 10'b0;
		row = row + 1'b1;
		end
	end
end

assign address = row * 640 + col;//640*480屏幕

//读取数据
always @(negedge clk)
begin
	pixel <= (DataSource[address] == 8'hff) ? 10'b11_1111_1111 : 10'd0;
end

always @ (negedge clk)
begin
	if (address > 640*480-1)
	begin
		$display("result: %d", oDigital);
		$display("recognition: %b", oRecognition);
		$stop();
	end
end

wire [3:0] oDigital;
wire [5:0] oRecognition;

//根据确定的上下左右边界识别数字
digital_recognition digital_recognition_xkw
(
	.clk(clk) ,	// input  clk_sig
	.rst(rst) ,	// input  rst_sig
	.en(rst) ,	// input  en_sig
	.iEdge_Row({10'd232, 10'd77}) ,	// input [17:0] iEdge_Row_sig
	.iEdge_Col({10'd159, 10'd74}) ,	// input [17:0] iEdge_Col_sig
	.iRow(row) ,	// input [8:0] iRow_sig
	.iCol(col) ,	// input [8:0] iCol_sig
	.iBWData(pixel) ,	// input  iBWData_sig
	.oDigital(oDigital), 	// output [3:0] oDigital_sig
	.oRecognition(oRecognition)
);


initial begin  clk = 1'b0;  rst = 1'b0;  ena = 1'b1;   #20   rst = 1'b1; end

always #30 clk = ~clk;

   
endmodule
