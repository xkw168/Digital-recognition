`timescale 1ns / 1ps
//`include "para.v"


module clk_div(iCLK,oCLK,div);
  input iCLK;
  output oCLK;
  parameter WIDE = 32;

input [WIDE-1:0] div ;

wire oCLK_odd,oCLK_even;

assign oCLK = div[0] ? oCLK_odd :oCLK_even ;

div_odd DUTo  (.iCLK(iCLK),.oCLK(oCLK_odd),	.div(div));
		
div_even DUTe (.iCLK(iCLK),.oCLK(oCLK_even),.div(div));
		
		
endmodule