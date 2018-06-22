`timescale 1ns / 10 ps
module rectangle_TB;
  reg clk; 
  reg rst; 
  reg ena;
  reg [7:0] DataSource[0:640*480-1];
  reg [7:0] outData[0:640*480-1];
  reg [9:0] pixel;
  wire [19:0] oRow, oCol;
  wire [9:0]oBWrgb;
  integer save_picture;
  integer i;

//读取数据
initial
begin
  
  $readmemh("imgdata5.txt",DataSource);//????
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
	outData[address] <= oBWrgb;
end

always @ (negedge clk)
begin
	if (address > 640*480-1)
	begin
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

  
//根据确定的上下左右边界画矩形框
rectangle rectangle_ltb
(
	.clk(clk) ,	// input  clk_sig
	.rst(rst) ,	// input  rst_sig
	.en(ena) ,
	.iRow({10'd374, 10'd95}) ,	// input [19:0] iRow_sig(369, 100)
	.iCol({10'd407, 10'd225}) ,	// input [19:0] iCol_sig(402, 230)
	.Row(row),
	.Col(col),
	.GRAY2BW(pixel) ,	// input [9:0] GRAY2BW_sig
	.oBWrgb(oBWrgb) 	// output [9:0] oBWrgb_sig
);


initial begin  clk = 1'b0;  rst = 1'b0;  ena = 1'b1;   #20   rst = 1'b1; end

always #30 clk = ~clk;

   
endmodule
