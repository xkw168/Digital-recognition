module img_process_xkw(
	oRed,
	oGreen,
	oBlue,
	oDigital,
	
	iVGA_X,
	iVGA_Y,
	iVGA_CLK,
	iRed,
	iGreen,
	iBlue,
	VGA_Read,
	SW,
	CLK,
	RST,
	LED
);


output  [9:0]  oRed;
output  [9:0]  oGreen;
output  [9:0]  oBlue;
output  [3:0]  oDigital;
output  [9:0]  LED;


input [9:0] iRed;
input [9:0] iGreen;
input [9:0] iBlue;
							
input [10:0] iVGA_X;
input [10:0] iVGA_Y;
input iVGA_CLK;											
							
input  [9:0]  SW;
input CLK, RST, VGA_Read;


wire [9:0] mRed;
wire [9:0] mGreen;
wire [9:0] mBlue;

wire [9:0] VGA_R_in;
wire [9:0] VGA_G_in;
wire [9:0] VGA_B_in;

reg [29:0] VGA_DATA ;

//选择图像来源（摄像头 or RAM）
assign mRed =   SW[6] ? pRed:iRed;
assign mGreen = SW[6] ? pGreen:iGreen;
assign mBlue =  SW[6] ? pBlue:iBlue;
//将读取的数据分为RGB三个分量
assign oRed = VGA_DATA[9:0] ;
assign oGreen = VGA_DATA[19:10];
assign oBlue = VGA_DATA[29:20] ;
//控制模块运行顺序
wire en_recogintion;

wire [9:0] tGREY;
wire [9:0] GREY2BW ;

wire VGA_CTRL_CLK,DLY_RST_2;
wire [9:0] LED;

wire [9:0] pRed;
wire [9:0] pGreen;
wire [9:0] pBlue;

//地址生成逻辑
reg [9:0]row, col;
reg [1:0]flag;
wire [18:0]address;
wire hscan, vscan, enable;
wire [1:0]edgeDetected;

assign hscan = ((edgeDetected[0] == 1'b0) || (enable == 1'b0)) ? 1'b1 : 1'b0;//加入enable是为了列扫描完之后重新回到行扫描
assign vscan = ((edgeDetected[0] == 1'b1) && (enable == 1'b1)) ? 1'b1 : 1'b0;//一旦确定了上下边界，就停止行扫描改为列扫描
assign enable = (edgeDetected == 2'b11) ? 1'b0 : 1'b1;
assign en_recogintion = ~enable;

always @(posedge CLK, negedge RST) 
begin
	if(!RST) 
	begin
		row = 10'b0;
		col = 10'b0;
		flag = 2'b0;
	end
	else if (iVGA_X==11'b0 && iVGA_Y==11'b0 && enable == 1'b0)//在确定边界过程中不需要使用VGA相关变量
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
	else if(hscan && (VGA_Read ==1'b1 || enable == 1'b1))//行扫描且VGA读数据或处于边界检测中
	begin
		col = col + 1'b1;
		if(col > 10'd639)
		begin
		col = 10'b0;
		row = (row < 10'd479) ? (row + 1'b1) : 1'b0;
		end
	end
	else if(vscan && (VGA_Read ==1'b1 || enable == 1'b1))//列扫描且VGA读数据或处于边界检测中
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


//时钟取反（上升沿地址变化，下降沿取数据）
assign VGA_CTRL_CLK = ~CLK;

//获取图片数据
img_src_xkw dut_img_src(
.oRed(pRed),
.oGreen(pGreen),
.oBlue(pBlue),							
.VGA_CTRL_CLK(VGA_CTRL_CLK),
.DLY_RST_2(DLY_RST_2),
.ADDR(address),
.SEL(SW[9:7])
);

//wire [9:0] pixel;
//assign pixel = {mRed,mGreen,mBlue} == 30'b0 ? 10'b0 : 10'b11_1111_1111;
//彩色图像转灰度图
RGB2GREY DUT_GREY (mRed,mGreen,mBlue,tGREY);
//灰度图转二值图
assign GREY2BW = (tGREY > 8'b0011_1111) ? 10'b11_1111_1111 : 10'b0 ; 

wire [19:0] oRow, oCol;
wire [9:0] oBWrgb;

//先进行边缘追踪(确定数字的外界矩形框)
edge_detection edge_detection_inst
(
	.clk(CLK) ,	// input  clk_sig
	.rst(RST) ,	// input  rst_sig
	.en(enable) ,	// input  en_sig
	.iRow(row) ,	// input [9:0] iRow_sig
	.iCol(col) ,	// input [9:0] iCol_sig
	.iHscan(hscan) ,	// input  iHscan_sig
	.iVscan(vscan) ,	// input  iVscan_sig
	.dataBW(GREY2BW) ,	// input [9:0] dataBW_sig
	.oRow(oRow) ,	// output [19:0] oRow_sig
	.oCol(oCol) ,	// output [19:0] oCol_sig
	.ofinish(edgeDetected) 	// output [1:0] ofinish_sig
);

assign LED[0] = edgeDetected[0];
assign LED[1] = edgeDetected[1];
assign LED[2] = enable;

//根据确定的上下左右边界画矩形框
rectangle rectangle_inst
(
	.clk(CLK) ,	// input  clk_sig
	.rst(RST) ,	// input  rst_sig
	.en(en_recogintion) ,	// input  en_sig
	.iRow(oRow) ,	// input [19:0] iRow_sig
	.iCol(oCol) ,	// input [19:0] iCol_sig
	.Row(row) ,	// input [9:0] Row_sig
	.Col(col) ,	// input [9:0] Col_sig
	.GRAY2BW(GREY2BW) ,	// input [9:0] GRAY2BW_sig
	.oBWrgb(oBWrgb) 	// output [9:0] oBWrgb_sig
);

//根据确定的上下左右边界识别数字
digital_recognition digital_recognition_xkw
(
	.clk(CLK) ,	// input  clk_sig
	.rst(RST) ,	// input  rst_sig
	.en(en_recogintion) ,	// input  en_sig
	.iEdge_Row(oRow) ,	// input [17:0] iEdge_Row_sig
	.iEdge_Col(oCol) ,	// input [17:0] iEdge_Col_sig
	.iRow(row) ,	// input [8:0] iRow_sig
	.iCol(col) ,	// input [8:0] iCol_sig
	.iBWData(GREY2BW) ,	// input  iBWData_sig
	.oDigital(oDigital), 	// output [3:0] oDigital_sig
	.oRecognition(LED[9:4])
);

assign DLY_RST_2 = RST;

always @ (SW[3:0])
begin
   case(SW[3:0])
   4'b0000:VGA_DATA = {mBlue,mGreen,mRed};
   4'b0001:VGA_DATA = 30'b11_1111_1111_11_1111_1111_11_1111_1111;
   4'b0010:VGA_DATA = 30'h0;
   4'b0011:VGA_DATA = {GREY2BW,GREY2BW,GREY2BW};
   4'b0111:VGA_DATA = {tGREY,tGREY,tGREY};
   4'b1111:VGA_DATA = {oBWrgb,oBWrgb,oBWrgb};
   //4'b1110:VGA_DATA = {Sobel_Out,Sobel_Out,Sobel_Out};//filter
   //4'b1100:VGA_DATA = {Sobel_2_Out,Sobel_2_Out,Sobel_2_Out};//BW
   //4'b1000:VGA_DATA = {Sobel_3_Out,Sobel_3_Out ,Sobel_3_Out};//GERY
 default:VGA_DATA = 30'b11_1111_1111_11_1111_1111_11_1111_1111;
	endcase
end


endmodule
