module address_gen (iRST_N,iCLK,oADDRESS,iEND_ADDRESS);
parameter WIDE =  23 ;
input iRST_N,iCLK;
output [WIDE-1:0 ] oADDRESS;

//parameter END_ADDRESS = 20'hFFFFF;

input [WIDE -1 : 0] iEND_ADDRESS;

reg [WIDE-1:0 ]addr_cnt ;

assign oADDRESS = addr_cnt;

//////////	 ADDRESS Generator	//////////////
always@(negedge iCLK or negedge iRST_N)

begin
parameter  ONE = 23'b1;
parameter ZERO = 23'b0;

	if(!iRST_N)
	addr_cnt	<=	ZERO;
	else
	begin
		if(addr_cnt < iEND_ADDRESS )
		addr_cnt	<=	addr_cnt+ ONE;
	//	else
		//addr_cnt	<=	ZERO;
	end
end

endmodule

