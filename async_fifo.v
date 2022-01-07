module async_fifo #(parameter addr_size=4,data_size=8)
						(input rd_clk,wr_clk,rrst,wrst,rd_en,wr_en,input[data_size-1:0]wr_data,
						  output [data_size-1:0]data_out,output full,empty);
						  
wire wfullen,rempty_en;
wire [addr_size-1:0]wr_addr,rd_addr;
wire [addr_size:0]wr_ptr,rd_ptr,sync_rdptr,sync_wptr;

assign wfullen=wr_en & ~full;//write on fifo when mem is not full and wr_en is high
assign rempty_en=rd_en & ~empty;
gray_ptr wr_gray(wr_clk,wrst, wfullen,full,1'b1,wr_ptr,wr_addr);//for counting write pointer
gray_ptr rd_gray(rd_clk,rrst, rempty_en,1'b1,empty,rd_ptr,rd_addr);
rdptr_sync synrd(wr_clk,wrst,rd_ptr,sync_rdptr);
wrptr_sync syncwr(rd_clk,rrst,wr_ptr,sync_wptr);
fifo_empty f_emp(rd_clk,rrst,rd_ptr,sync_wptr,empty);
fifo_full f_full(wr_clk,wrst,wr_ptr,sync_rdptr,full );
fifo_mem_rd_wr mem1(wr_clk,wfullen,rempty_en,wr_addr,rd_addr,wr_data,data_out);
endmodule
