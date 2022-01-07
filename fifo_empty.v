module fifo_empty #(parameter addr_size=4)(input rclk,rrst,input[addr_size:0]rd_ptr,sync_wptr,output reg empty );

always@(posedge rclk or negedge rrst)
begin
if(!rrst) empty<=1'b1;
else if(rd_ptr==sync_wptr) empty<=1'b1;
else empty<=1'b0;
end
endmodule
