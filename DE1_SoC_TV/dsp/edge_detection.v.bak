/*
author: xkw
time: 2018.5.29
*/
module edge_detection(
     clk,
	 rst,
	 en,
	 iRow,
	 iCol,
	 iHscan,
	 iVscan,
	 dataBW,
	 oRow,
	 oCol,
	 ofinish
);

input clk;//时钟信号
input en;//模块使能信号
input rst;//复位信号
input iHscan, iVscan;//行or列扫描标志
input [9:0]iRow, iCol;//当前像素点位于第几行第几列
input [9:0]dataBW;//输入的二值图像数据
output [19:0]oRow;//低9位表示上边界的行数，高9位表示下边界的行数
output [19:0]oCol;//低9位表示左边界的列数，高9位表示右边界的列数
output [1:0]ofinish;//低位用于表示上下边界是否确定，高位用于表示左右边界是否确定

/*****************reg declaration***************************/
reg [19:0]oRow;
reg [19:0]oCol;
reg [1:0]ofinish;
reg [9:0]sum, hCount, vCount;
reg upEdge, leftEdge;//用于标志当前是否已经确定上、左边界
/*****************wire declaration**************************/
wire [3:0]threshold;
wire [2:0]offset;

assign threshold = 4'd3;
assign offset = 3'd5;

//每个时钟上升沿送入一个二值图像数据
always@(posedge clk, negedge rst)
begin
  if(!rst)
  begin
    hCount <= 10'b0;
	vCount <= 10'b0;
	sum <= 10'b0;
	upEdge <= 1'b0;
	leftEdge <= 1'b0;
	ofinish <= 2'b0;
  end
  else if (en)
    begin
	 
	 
      if(iHscan)//行扫描
	  begin
	  
	    hCount <= hCount + 1'b1;
		 
	    if(dataBW == 10'd0)
	    begin
	      sum <= sum + 1'b1;
	    end
		 
		if(hCount >= 10'd639)
			begin
				if(!upEdge)
					begin
						if(sum > threshold)
							begin
								oRow[9:0] <= (iRow - offset);
								upEdge <= 1'b1 ;
							end
					end
				else
					begin
						if(sum < threshold)
							begin
								oRow[19:10] <= (iRow + offset);
								ofinish[0] <= 1'b1 ;
							end
					end
				hCount <= 10'b0 ;
				sum <= 10'b0 ;
			end	
	  end
	  
	  
	  else if(iVscan)//列扫描
	  begin
	  
	    vCount <= vCount + 1'b1;
		 
	    if(dataBW == 10'd0)
	    begin
	      sum <= sum + 1'b1;
	    end


	  	if(vCount >= 10'd479)
			begin
				if(!leftEdge)
					begin
						if(sum > threshold)
							begin
								oCol[9:0] <= (iCol - offset);
								leftEdge <= 1'b1 ;
							end
					end
				else
					begin
						if(sum < threshold)
							begin
								oCol[19:10] <= (iCol + offset);
								ofinish[1] <= 1'b1 ;
							end
					end
				vCount <= 10'b0 ;
				sum <= 10'b0 ;
			end	 
    end
  end
end

endmodule







//	    if(!upEdge)//还未确定上边界
//		begin
//		  if(hCount >= 10'd639)//扫描完一行
//		  begin
//		    if(sum > threshold)//大于阈值，判断为上边界
//			begin
//			  oRow[9:0] <= iRow;
//			  upEdge <= 1'b1;
//			end
//			hCount <= 10'b0;//重置列计数
//			sum <= 10'b0;//重置总和
//		  end
//		end
//		
//		
//		 else if(upEdge)//已经确定上边界
//		begin
//		  if(hCount >= 10'd639)//扫描完一行
//		  begin
//		    if(sum < threshold)//小于阈值，判断为下边界
//			begin
//			  oRow[19:10] <= iRow;
//			  ofinish[0] <= 1'b1;//低位置高，表示确定了上下边界
//			end
//			hCount <= 10'b0;//重置列计数
//			sum <= 10'b0;
//		  end
//		end



//	    if(!leftEdge)//还未确定左边界
//		begin
//		  if(vCount >= 10'd479)//扫描完一列
//		  begin
//		    if(sum > threshold)//大于阈值，判断为左边界
//			begin
//			  oCol[9:0] <= iCol;
//			  leftEdge <= 1'b1;
//			end
//			vCount <= 10'b0;//重置列计数
//			sum <= 10'b0;//重置总和
//		  end
//		end
//		
//		
//		else if(leftEdge)//已经确定左边界
//		begin
//		  if(vCount >= 10'd479)//扫描完一列
//		  begin
//		    if(sum < threshold)//小于阈值，判断为下边界
//			begin
//			  oCol[19:10] <= iCol;
//			  ofinish[1] <= 1'b1;//高位置高，表示确定了左右边界
//			end
//			vCount <= 10'b0;//重置列计数
//			sum <= 10'b0;
//		  end
//		end
//	  end