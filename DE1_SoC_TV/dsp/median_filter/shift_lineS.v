module shift_lineS (data_in,dataoutb,dataoutc,clk,clear);
input clk,clear;
input [7:0] data_in;
//output reg [7:0] dataouta;
output reg [7:0] dataoutb;
output reg [7:0] dataoutc;


always @(posedge clk or negedge clear )
begin
if (!clear) begin dataoutb = 8'b0;dataoutc = 8'b0;end

else dataoutc<= dataoutb; dataoutb<= data_in;
end
endmodule
