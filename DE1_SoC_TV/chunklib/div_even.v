//`include "para.v"
//`define WIDE 16
`timescale 1ns / 1ps

module div_even (iCLK,oCLK,div);
input iCLK;
parameter WIDE = 32;
input [WIDE-1:0] div;
output oCLK;
reg outCLK;
initial outCLK = 1'b0;

reg [WIDE-1:0 ]cnt ;
initial cnt = 0;

 always @ (posedge iCLK)
 begin
 if (cnt < (div[WIDE-1:1]-1)  ) cnt <= cnt +32'b1;  // div /2  eg. div2 is 1 div 4 is 2 
 else begin cnt <= 0; outCLK <= ~outCLK; end
 end
 
 assign oCLK = (div != 32'd1 ) ?  outCLK :iCLK ;
 endmodule
 