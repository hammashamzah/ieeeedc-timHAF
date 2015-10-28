`timescale 100ns / 10ns
`define WIDTH 16

module tb_Controller_Stage1;

  reg clk;
  reg rst;
  wire write_FIFO1;
  wire write_FIFO2;
  wire write_FIFO3;
  wire write_FIFO4;
  wire read_FIFO1;
  wire read_FIFO2;
  wire read_FIFO3;
  wire read_FIFO4;
  wire sel_demux1;
  wire sel_demux2;
  wire sel_demux3;
  wire done;
  

  Controller_Stage1 dut
  (
    .clk(clk),
    .rst(rst),
    .write_FIFO1(write_FIFO1),
    .write_FIFO2(write_FIFO2),
    .write_FIFO3(write_FIFO3),
    .write_FIFO4(write_FIFO4),
    .read_FIFO1(read_FIFO1),
    .read_FIFO2(read_FIFO2),
    .read_FIFO3(read_FIFO3),
    .read_FIFO4(read_FIFO4),
    .sel_demux1(sel_demux1),
    .sel_demux2(sel_demux2),
    .sel_demux3(sel_demux3),
    .done(done)
  );

 initial begin
    rst   = 1'b1;
    clk   = 1'b0;
    
    #1; 
      rst     = 1'b0;  
  end

  always #0.5 clk = !clk;
endmodule
