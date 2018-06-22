module();

reg [8:0]row, col;
wire [16:0]address;
wire hscan, vscan;

always @(posedge clk) 
begin
  if(!rst) 
  begin
    row = 8'b0;
	col = 8'b0;
  end
  else if(hscan)//行扫描
  begin
    col = col + 1'b1;
	if(col > 319)
	begin
	  col = 1'b0;
	  row = (row < 240) ? (row + 1'b1) : 1'b0;
	end
  end
  else if(vscan)//列扫描
  begin
    row = row + 1'b1;
	if(row > 239)
	begin
	  row = 1'b0;
	  col = (row < 360) ? (col + 1'b1) : 1'b0;
	end
  end
end

assign address = row * 320 + col;