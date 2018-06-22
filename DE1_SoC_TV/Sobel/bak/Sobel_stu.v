/* 
(C) OOMusou 2008 http://oomusou.cnblogs.com

Filename    : Sobel.v
Compiler    : Quartus II 8.0
Description : Demo how to implement Sobel Edge Detector on DE2-70
Release     : 09/27/2008 1.0
*/

module Sobel (
  input            iCLK,
  input            iRST_N,
  input      [7:0] iTHRESHOLD,
  input            iDVAL,
  input      [9:0] iDATA,
  output reg       oDVAL,
  output wire [9:0] oDATA
);

// mask x
parameter X1 = 8'hff, X2 = 8'h00, X3 = 8'h01;
parameter X4 = 8'hfe, X5 = 8'h00, X6 = 8'h02;
parameter X7 = 8'hff, X8 = 8'h00, X9 = 8'h01;

// mask y
parameter Y1 = 8'h01, Y2 = 8'h02, Y3 = 8'h01;
parameter Y4 = 8'h00, Y5 = 8'h00, Y6 = 8'h00;
parameter Y7 = 8'hff, Y8 = 8'hfe, Y9 = 8'hff;

wire  [7:0] Line0;
wire  [7:0] Line1;
wire  [7:0] Line2;

wire  [17:0]  Mac_x0;
wire  [17:0]  Mac_x1;
wire  [17:0]  Mac_x2;

wire  [17:0]  Mac_y0;
wire  [17:0]  Mac_y1;
wire  [17:0]  Mac_y2;

wire  [19:0]  Pa_x;
wire  [19:0]  Pa_y;

wire  [15:0]  Abs_mag;


assign oDATA = iDATA;
// replace the above

endmodule