module fifo_mem_rd_wr #(parameter addr_size=4,data_size=8)(input wr_clk,wr_en,rd_en,input[addr_size-1:0]wr_addr,rd_addr,
							input[data_size-1:0]wr_data,output[data_size-1:0]data_out);

localparam len=2**addr_size;							
reg [data_size-1:0]fifo_mem[0:len-1];				
assign data_out=rd_en?fifo_mem[rd_addr]:0;
always@(posedge wr_clk)
begin
	if(wr_en) fifo_mem[wr_addr]<=wr_data;
end
endmodule
