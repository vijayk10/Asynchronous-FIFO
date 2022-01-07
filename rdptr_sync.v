module rdptr_sync #(parameter addr_size=4)(input wclk,wrst,input[addr_size:0]rd_ptr,output reg[addr_size:0]sync_rdptr);

reg [addr_size:0]temp;
always@(posedge wclk or negedge wrst)//write pointer work on read clock
begin
if(!wrst)begin sync_rdptr<=0;
						temp<=0; end
else begin
			temp<=rd_ptr;
			sync_rdptr<=temp;
		end
end
endmodule
