`timescale 100ns / 10ns
`define WIDTH 16
module tb_fifo;
  reg clk;
  reg rst;
  reg [`WIDTH-1:0] buf_in;
  reg wr_en;
  reg rd_en;
  
  wire [`WIDTH-1:0] buf_out;

  fifo dut
  (
    .clk(clk),
    .rst(rst),
    .buf_in(buf_in),
    .buf_out(buf_out),
    .wr_en(wr_en),
    .rd_en(rd_en)
  );

  initial begin
    rst   = 1'b1;
    clk   = 1'b0;
    wr_en = 1'b0;
    rd_en = 1'b0;
    buf_in = 16'd0; 

    #1; 
      rst     = 1'b0;
      wr_en   = 1'b1;   
  end

  always #0.5 clk = !clk;
  always @(posedge clk) 
  begin
    buf_in <= buf_in + 8'd30;
  end
endmodule
