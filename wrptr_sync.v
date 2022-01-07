module wrptr_sync #(parameter addr_size=4)(input rclk,rrst,input[addr_size:0]wr_ptr,output reg[addr_size:0]sync_wptr);

reg [addr_size:0]temp;
always@(posedge rclk or negedge rrst)//write pointer work on read clock
begin
if(!rrst)begin sync_wptr<=0;
						temp<=0; end
else begin
			temp<=wr_ptr;
			sync_wptr<=temp;
		end
end
endmodule
