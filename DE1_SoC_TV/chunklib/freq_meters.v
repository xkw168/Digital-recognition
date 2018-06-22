module freq_meters (reset,iCLK,clk1hz,ofreqnum);
input reset,iCLK,clk1hz;
output[31:0] ofreqnum;
reg strobe;
reg [31:0] freq_count;

reg [31:0] ofreqnum;

//initial strobe = 1'b0;
always @(posedge clk1hz or negedge reset)
begin
if (!reset) strobe <= 1'b0;
else strobe <= ~strobe;
end


always @( posedge iCLK or negedge reset)
begin
	if(!reset)
		freq_count = 32'b0;
	else begin
		      if (strobe)
begin
if (freq_count[3:0]  < 4'd9 )  freq_count[3:0] <= freq_count[3:0] + 4'b1;
else begin freq_count[3:0] <= 4'b0; if (freq_count[7:4]  < 4'd9 ) freq_count[7:4] <= freq_count[7:4] + 4'b1;
else begin freq_count[7:4] <= 4'b0; if (freq_count[11:8]  < 4'd9 ) freq_count[11:8] <= freq_count[11:8] + 4'b1;
else begin freq_count[11:8] <= 4'b0; if (freq_count[15:12]  < 4'd9 ) freq_count[15:12] <= freq_count[15:12] + 4'b1;
else begin freq_count[15:12] <= 4'b0; if (freq_count[19:16]  < 4'd9 ) freq_count[19:16] <= freq_count[19:16] + 4'b1;
else begin freq_count[19:16] <= 4'b0; if (freq_count[23:20]  < 4'd9 ) freq_count[23:20] <= freq_count[23:20] + 4'b1;
else begin freq_count[23:20] <= 4'b0; if (freq_count[27:24]  < 4'd9 ) freq_count[27:24] <= freq_count[27:24] + 4'b1;
else begin freq_count[27:24] <= 4'b0; if (freq_count[31:28]  < 4'd9 ) freq_count[31:28] <= freq_count[31:28] + 4'b1;
else  freq_count[31:28] <= 4'b0; 
     end  end end end end end end
end	  
				//				     freq_count <= freq_count +32'b1;
          else freq_count <= 32'b0; 
			    end
end

//assign ofreqnum = 20;

always @(negedge strobe)
//ofreqnum = 20;//
ofreqnum <= freq_count;
endmodule
