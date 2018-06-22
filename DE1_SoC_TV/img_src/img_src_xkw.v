module img_src_xkw(
	oRed,
	oGreen,
	oBlue,							
	VGA_CTRL_CLK,
	DLY_RST_2,
	ADDR,
	SEL
);

// 33.7khz 64.2hz   720*480 
input VGA_CTRL_CLK;    //VGA时钟
input DLY_RST_2;       //RST信号
input [2:0]SEL;	     //图片选择
input [18:0] ADDR;     //Ram地址

output  [9:0]  oRed;
output  [9:0]  oGreen;
output  [9:0]  oBlue;

reg [2:0]img_sel;

wire  BWDATA;
wire bgr_data_raw, bgr_data_raw3, bgr_data_raw5, bgr_data_raw9;

//将读入的1位二值转换为10位RGB值
assign oRed = bgr_data_raw ? 10'b11_1111_1111 : 10'b0 ;
assign oGreen = bgr_data_raw ? 10'b11_1111_1111 : 10'b0 ;
assign oBlue = bgr_data_raw ? 10'b11_1111_1111 : 10'b0 ;

assign bgr_data_raw = img_sel[0] ? bgr_data_raw3 : 
							   (img_sel[1] ? bgr_data_raw5 :
								  img_sel[2] ? bgr_data_raw9 : bgr_data_raw3);


always@(SEL)
begin
	case(SEL)
		3'b001 : img_sel = 3'b001;
		3'b010 : img_sel = 3'b010;
		3'b011 : img_sel = 3'b010;
		3'b100 : img_sel = 3'b100;
		3'b110 : img_sel = 3'b100;
		3'b111 : img_sel = 3'b100;
		default : img_sel = 3'b001;
		endcase
end

//读取数字3
img_data3	img_data_dut3 (
	.address ( ADDR ),
	.clock ( VGA_CTRL_CLK ),
	.q ( bgr_data_raw3 ),
	.enable(img_sel[0])
	);
//读取数字5
img_data5	img_data_dut5 (
	.address ( ADDR ),
	.clock ( VGA_CTRL_CLK ),
	.q ( bgr_data_raw5 ),
	.enable(img_sel[1])
	);

//读取数字9
img_data9	img_data_dut9 (
	.address ( ADDR ),
	.clock ( VGA_CTRL_CLK ),
	.q ( bgr_data_raw9 ),
	.enable(img_sel[2])
	);
	
endmodule


