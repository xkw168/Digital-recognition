//`include "para.v"
`define WI 32
`timescale 1ns / 1ps

module div_odd (iCLK,oCLK,div);
input iCLK;
parameter WIDE = 32;
input [WIDE-1:0] div;
output oCLK;
wire oCLK;
reg outCLK;

reg cout;
reg [WIDE-1:0 ]cnt ;
initial cnt = 0;
wire inCLK;
reg cc;
initial cc = 0;

always @(posedge  cout) 	cc <= ~ cc; 

assign inCLK  = iCLK ^ cc;

 always @ (posedge inCLK)
 begin
 if (cnt < (div[WIDE-1:1])) begin  cnt <= cnt +32'b1;  cout <= 1'b0; end// div /2  eg. div2 is 1 div 4 is 2 
 else begin cnt <= 0 ; cout <= 1'b1;end
 end

 always @ (negedge iCLK) 	outCLK <= cout; 

 assign oCLK = (div != 32'd1 ) ?  cc :iCLK ;

 endmodule
 