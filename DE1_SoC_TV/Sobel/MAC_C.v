
`timescale 1 ns / 10 ps
// synopsys translate_on
module MAC_C (
	aclr0,
	clock0,
	dataa_0,
	datab_0,
	datab_1,
	datab_2,
	result);

	input	  aclr0;
	input	  clock0;
	input	signed [7:0]  dataa_0;
	input	signed [7:0]  datab_0;
	input	signed [7:0]  datab_1;
	input	signed [7:0]  datab_2;
	output signed 	[17:0]  result;

reg signed [7:0]  data_a;
reg signed [7:0]  data_b;
reg signed [7:0]  data_c;

always @(posedge clock0 or negedge aclr0)
begin

 if (!aclr0) begin
   data_a <= 8'b0;
   data_b <= 8'b0;
   data_c <= 8'b0;
  end


 else
  begin
   data_a <= dataa_0;
   data_b <= data_a;
   data_c <= data_b;

 end

end



assign result = data_a*datab_0 + data_b*datab_1 + data_c*datab_2 ;

endmodule

