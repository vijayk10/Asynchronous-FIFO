module gray_ptr #(parameter addr_size=4)
				(input clk,rst, inc_en,full,empty,output reg[addr_size:0]nxt_gray,output[addr_size:0]mem_addr );
		
wire [addr_size:0] nxt_binary;
reg [addr_size:0] binary;	

always @(posedge clk or negedge rst)
if(!rst) begin binary<=0;nxt_gray<=0;end
else if(inc_en) begin binary<=nxt_binary;nxt_gray<=nxt_binary ^ (nxt_binary>>1);end

//assign binary<=nxt_binary;
assign nxt_binary=binary+(inc_en & (~full|~empty));
//assign nxt_gray=nxt_binary ^ (nxt_binary>>1);
assign mem_addr=binary[addr_size-1:0];
endmodule
