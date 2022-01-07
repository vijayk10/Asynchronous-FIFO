module tb_async_fifo;
reg wr_clk,rd_clk;
reg[7:0] data_in;
wire[7:0] data_out;
wire rd_empty,wr_full;
reg reset_w;
reg reset_r;
reg write_enable,read_enable;
wire [4:0]rdptr,wrptr;
assign rdptr=dut.sync_rdptr;
assign wrptr=dut.wr_ptr;
async_fifo dut(rd_clk,wr_clk,reset_r,reset_w,read_enable,write_enable,data_in,data_out,wr_full,rd_empty);
initial
begin
#0 data_in=8'h0;
#50 data_in=8'd10 ;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd20;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd30;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd40;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd50;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd60;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd70;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd80;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd90;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd100;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd110;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd120;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd130;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd140;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd150;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd160;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd170;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd180;write_enable=1'b1;
#50 write_enable=1'b0;
#200 data_in=8'd190;write_enable=1'b1;
#50 write_enable=1'b0;
end

initial
begin
 wr_clk=1'b0;
  rd_clk=1'b0;
 write_enable=1'b0;
read_enable=1'b0;
reset_r=1'b0;
reset_w =1'b0;
 end
 
 always begin #30 wr_clk=~wr_clk;end // READ AND WRITE CLOCK GENERATION

 always
 #20 rd_clk=~rd_clk;
 
 initial
 #10 reset_r=1'b1;
 
 initial
 #10 reset_w=1'b1;
//initial

 //#10 write_enable=1'b1;
 initial begin
 #6000 read_enable=1'b1;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #180 read_enable=1'b1;#20 read_enable=1'b0;
 #1000 $stop;
 end
 //initial 
 //#6000 always #190 read_enable=1'b0;
 initial
 begin

 $monitor("time=%t, data_out=%d,empty=%d ,full= %d, mem[15]=%d",$time,data_out,rd_empty,wr_full, dut.mem1.fifo_mem[15]);
end

endmodule
