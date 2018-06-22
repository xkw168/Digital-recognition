module TD_Detect(	
          oTD_Stable,
          oNTSC,
          oPAL,
					iTD_VS,
					iTD_HS,
					iRST_N	);
input		iTD_VS;
input		iTD_HS;
input		iRST_N;
output	oTD_Stable;
output  oNTSC;
output  oPAL;
reg			NTSC;
reg			PAL;
reg			Pre_VS;
reg	[7:0]	Stable_Cont;

assign	oTD_Stable	=	NTSC || PAL;
assign  oNTSC  = NTSC;
assign  oPAL   = PAL;

always@(posedge iTD_HS or negedge iRST_N)
	if(!iRST_N)
	begin
		Pre_VS		  <=	1'b0;
		Stable_Cont	<=	4'h0;
		NTSC	<=	1'b0;
		PAL  	<=	1'b0;
	end
	else
	begin
		Pre_VS	<=	iTD_VS;
		if(!iTD_VS)
		  Stable_Cont	<=	Stable_Cont+1'b1;
		else
		  Stable_Cont	<=	0;
		
		if({Pre_VS,iTD_VS}==2'b01)
		begin
			if((Stable_Cont>=4 && Stable_Cont<=14))
			  NTSC	<=	1'b1;
			else
			  NTSC	<=	1'b0;
			
			if((Stable_Cont>=8'h14 && Stable_Cont<=8'h1f))
			  PAL	<=	1'b1;
			else
			  PAL	<=	1'b0;
		end
	end

endmodule
