module fifo_full #(parameter addr_size=4)(input wclk,wrst,input[addr_size:0]wr_ptr,sync_rdptr,output reg full );

always@(posedge wclk or negedge wrst)
begin
if(!wrst) full<=1'b0;
else if((wr_ptr[addr_size]!=sync_rdptr[addr_size] )&& (wr_ptr[addr_size-1]!=sync_rdptr[addr_size-1])&& 
				wr_ptr[addr_size-2:0]==sync_rdptr[addr_size-2:0]) full<=1'b1;
else full<=1'b0;
end
endmodule
