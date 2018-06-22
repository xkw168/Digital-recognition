/* 
(C) OOMusou 2008 http://oomusou.cnblogs.com

Filename    : Sobel.v
Compiler    : Quartus II 8.0
Description : Demo how to implement Sobel Edge Detector on DE2-70
Release     : 09/27/2008 1.0
*/
`timescale 100 ns / 10 ps
module Sobel (
  input            iCLK,
  input            iRST_N,
  input      [7:0] iTHRESHOLD,
  input            iDVAL,
  input      [9:0] iDATA,
  output reg       oDVAL,
  output reg [9:0] oDATA
);


// mask Y
parameter signed Y1 =  8'h01; //+1
parameter signed Y2 = 8'h00;  //0
parameter signed  Y3 = 8'hff;  //-1
parameter signed Y4 = 8'h02;  //+2
parameter signed Y5 = 8'h00;  //0
parameter signed  Y6 = 8'hFe;  //-2
parameter signed Y7 = 8'h01;   //1
parameter signed Y8 = 8'h00;   //0 
parameter signed  Y9 = 8'hFF;  //-1

// mask X
parameter  signed X1 = 8'h01;  //1
parameter  signed  X2 = 8'h02; //2
parameter  signed  X3 = 8'h01;  //1
parameter  signed X4 = 8'h00;  //0 
parameter  signed  X5 = 8'h00; //0 
parameter  signed  X6 = 8'h00; //0 
parameter  signed X7 = 8'hff;  //-1
parameter  signed  X8 = 8'hfe; //-2
parameter  signed  X9 = 8'hff; //-1

wire  [7:0] Line0;
wire  [7:0] Line1;
wire  [7:0] Line2;

wire  signed [17:0]  Mac_x0;
wire  signed [17:0]  Mac_x1;
wire  signed [17:0]  Mac_x2;

wire  signed [17:0]  Mac_y0;
wire  signed [17:0]  Mac_y1;
wire  signed [17:0]  Mac_y2;



wire  [15:0]  Abs_mag;

LineBuffer_S b0 (
  .clken(iDVAL),
  .clock(iCLK),
  .shiftin(iDATA[9:2]),
  .taps0x(Line0),
  .taps1x(Line1),
  .taps2x(Line2)
);

// X
//MAC_C x0 (
//  .iDVAL(!iRST_N),
//  .iCLK(iCLK),
//  .dataa_0(Line0),
//  .datab_0(X9), //-1
//  .datab_1(X8), //-2
//  .datab_2(X7),
//  .result(Mac_x0) //-1
//);

reg signed [9:0]  data_a;
reg signed [9:0]  data_b;
reg signed [9:0]  data_c;

always @(posedge iCLK)
begin

 if (iDVAL)
   
  begin
   data_a <= {2'b0,Line0};
   data_b <= data_a;
   data_c <= data_b;

  end

end

wire [9:0] tmp_data_b;
 
assign tmp_data_b = {data_b[8:0],1'b0};
wire [9:0]  result_a;
assign result_a = {~data_a+10'b1} +{~tmp_data_b +10'b1}  + {~data_c+10'b1};
////////////////////////////////////

//MAC_C x1 (
//  .iDVAL(!iRST_N),
//  .iCLK(iCLK),
//  .dataa_0(Line1),
//  .datab_0(X6), //0
//  .datab_1(X5), //0
//  .datab_2(X4), //0
//  .result(Mac_x1)
//);

//reg signed [9:0]  data_a;
//reg signed [9:0]  data_b;
//reg signed [9:0]  data_c;
//
//always @(posedge iCLK or negedge iDVAL)
//begin
//
// if (!iDVAL) begin
//   data_a <= 10'b0;
//   data_b <= 10'b0;
//   data_c <= 10'b0;
//  end
//
//
// else
//  begin
//   data_a <= {2'b0,Line0};
//   data_b <= data_a;
//   data_c <= data_b;
//
// end
//
//end
//
//assign tmp_data_b = {data_b[8:0],1'b0}
//wire [9:0]  result;
//assign result = {~data_a+10'b1} +{~tmp_data_b +10'b1}  + {~data_c+10'b1};
////////////////////////////////////

//MAC_C x2 (
//  .iDVAL(!iRST_N),
//  .iCLK(iCLK),
//  .dataa_0(Line2),
//  .datab_0(X3), // 1
//  .datab_1(X2),//2
//  .datab_2(X1),  //1
//  .result(Mac_x2)
//);
reg signed [9:0]  datac_a;
reg signed [9:0]  datac_b;
reg signed [9:0]  datac_c;

always @(posedge iCLK)
begin

 if (iDVAL)
  begin
   datac_a <= {2'b0,Line2};
   datac_b <= datac_a;
   datac_c <= datac_b;

 end

end
wire [9:0] tmp_datac_b;
assign tmp_datac_b = {datac_b[8:0],1'b0};
wire [9:0]  result_c;
assign result_c =  datac_a + tmp_datac_b + datac_c ;


////////////////////////////////////////////
// Y
//MAC_C y0 (
//  .iDVAL(!iRST_N),
//  .iCLK(iCLK),
//  .dataa_0(Line0),
//  .datab_0(Y9), // 1
//  .datab_1(Y8),  // 0
//  .datab_2(Y7),  //-1
//  .result(Mac_y0)
//);

reg signed [9:0]  ydata_a;
reg signed [9:0]  ydata_b;
reg signed [9:0]  ydata_c;

always @(posedge iCLK )
begin

 if (iDVAL) 
  begin
   ydata_a <= {2'b0,Line0};
   ydata_b <= ydata_a;
   ydata_c <= ydata_b;

 end

end


wire [9:0]  yresult_a;
assign yresult_a =  {~ydata_a+10'b1} +  ydata_c;


///////////////////////

//MAC_C y1 (
//  .iDVAL(!iRST_N),
//  .iCLK(iCLK),
//  .dataa_0(Line1),
//  .datab_0(Y6), //2
//  .datab_1(Y5),  //0
//  .datab_2(Y4),  //-2
//  .result(Mac_y1)
//);
reg signed [9:0]  ydatab_a;
reg signed [9:0]  ydatab_b;
reg signed [9:0]  ydatab_c;

always @(posedge iCLK)
begin

 if (iDVAL) 
  begin
   ydatab_a <= {2'b0,Line1};
   ydatab_b <= ydatab_a;
   ydatab_c <= ydatab_b;

 end

end

assign tmp_ydatab_a = {ydatab_a[8:0],1'b0};
assign tmp_ydatab_c = {ydatab_c[8:0],1'b0};

wire [9:0]  yresult_b;
assign yresult_b = {~tmp_ydatab_a+10'b1} + tmp_ydatab_c  ;


/////////////////////////////////////////

//MAC_C y2 (
//  .iDVAL(!iRST_N),
//  .iCLK(iCLK),
//  .dataa_0(Line2),
//  .datab_0(Y3), //-1
//  .datab_1(Y2), //0
//  .datab_2(Y1), //1
//  .result(Mac_y2)
//);
reg signed [9:0]  ydatac_a;
reg signed [9:0]  ydatac_b;
reg signed [9:0]  ydatac_c;

always @(posedge iCLK )
begin

 if (iDVAL) 
  begin
   ydatac_a <= {2'b0,Line2};
   ydatac_b <= ydatac_a;
   ydatac_c <= ydatac_b;

 end

end


wire [9:0]  yresult_c;
assign yresult_c =  {~ydatac_a+10'b1} +  ydatac_c;


/////////////////////////
//PA_S pa0 (
//  //.clock(iCLK),
//  .data0x(Mac_x0),
//  .data1x(Mac_x1),
//  .data2x(Mac_x2),
//  .result(Pa_x)
//);
//
wire  signed [11:0]  Pa_x;
wire  signed [11:0]  Pa_y;


assign Pa_x = $signed(result_c) + $signed(result_a);

//PA_S pa1 (
//  //.clock(iCLK),
//  .data0x(Mac_y0),
//  .data1x(Mac_y1),
//  .data2x(Mac_y2),
//  .result(Pa_y)
//);
assign Pa_y = $signed(yresult_c) + $signed(yresult_b)+ $signed(yresult_a);

wire signed [31:0] tmp_cj;

assign  tmp_cj = Pa_x*Pa_x+Pa_y*Pa_y;

SQRT_S sqrt0 (
  //.clk(iCLK),
  //.radical($signed(Pa_x)*$signed(Pa_x)+$signed(Pa_y)*$signed(Pa_y) ),
  .radical(tmp_cj),
  .q(Abs_mag)
);

always@(posedge iCLK, negedge iRST_N)
begin
 
 if (!iRST_N)
    begin
     oDVAL <= 0;
	  oDATA <= 10'b0;
	 end
  else 
   begin
    oDVAL <= iDVAL;
    
    if (iDVAL)
      oDATA <= (Abs_mag > {8'b0,iTHRESHOLD}) ? 10'b0 : 10'b11_1111_1111;
    else
      oDATA <= 10'b0;
   end
end

endmodule