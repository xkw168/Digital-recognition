/* 
(C) chunk 2012 

Filename    : medianfilter.v
Compiler    : Quartus II 11.sp2
Description : Demo how to implement medianfilter on DE2-115
Release     : 06/01/2012 1.0
*/
module medianfilterblock (
input KEY,
  input            iCLK,
  input            iRST_N,
  input            iDVAL,
  input      [9:0] iDATA,
 // output reg       oDVAL,
  output reg [9:0] oDATA
);


wire [7:0]  m11,m12,m13,m21,m22,m23,m31,m32,m33;
wire  [7:0] Line0;
wire  [7:0] Line1;
wire  [7:0] Line2;
wire [7:0] tDATA,aDATA;

LineBuffer_S DUT_MEDIANFILTER_LINEBUFF (
  .clken(iDVAL),
  .clock(iCLK),
  .shiftin(iDATA[9:2]),
  .taps0x(Line0),
  .taps1x(Line1),
  .taps2x(Line2)
);

shift_lineS dut_shit_L1 
(
.data_in(Line0),
//dataouta(),
.dataoutb(m12),
.dataoutc(m11),
.clk(iCLK),
.clear(iRST_N));

shift_lineS dut_shit_L2 
(
.data_in(Line1),
//dataouta(),
.dataoutb(m22),
.dataoutc(m21),
.clk(iCLK),
.clear(iRST_N));

shift_lineS dut_shit_L3 
(
.data_in(Line2),
//dataouta(),
.dataoutb(m32),
.dataoutc(m31),
.clk(iCLK),
.clear(iRST_N));
averagefilter dut_filtera
(

.clk(iCLK),
.m11(m11),.m12(m12),.m13(Line0),
.m21(m21), .m22(m22), .m23(Line1),
.m31(m31) ,.m32(m32),.m33(Line2),
.mid(aDATA)


);
medfilter dut_filterm
(

.clk(iCLK),
.m11(m11),.m12(m12),.m13(Line0),
.m21(m21), .m22(m22), .m23(Line1),
.m31(m31) ,.m32(m32),.m33(Line2),
.mid(tDATA)


);


always@(posedge iCLK, negedge iRST_N) begin
 if (!iRST_N)
 //oDVAL <= 0;
 oDATA <= 10'b0;
 else
   begin
 //   oDVAL <= iDVAL;
    
    if (iDVAL)
      //oDATA <= KEY ? {aDATA,2'b0}: {tDATA,2'b0};
		oDATA <= {tDATA,2'b0};
    else
      oDATA <= 10'b0;
  end
end

endmodule

