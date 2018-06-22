module RGB2GREY(iR,iG,iB,oGREY);
input [9:0] iR;
input [9:0] iG;
input [9:0] iB;
output [9:0] oGREY;
reg  [19:0] tDATA;
always @(*)
begin
tDATA = 10'b10_0110_0100*iR + 10'b0100_1011_0010*iG  + 10'b00_1110_1001*iB;
//0.299*R + 0.587*G + 0.114*B
end
assign oGREY = tDATA [19:10];

endmodule
