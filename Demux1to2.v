`define WIDTH 16

module Demux1to2(in,out1,out2,sel);
  input   [`WIDTH-1:0] in;
  input   sel;
  output reg [`WIDTH-1:0] out1;
  output reg [`WIDTH-1:0] out2;
  
  always@(in,sel)
  begin
    if(sel)
      begin
      out1 <= in;
      out2 <= 16'bzzzzzzzzzzzzzzzz;
      end
    else
      begin
      out1 <= 16'bzzzzzzzzzzzzzzzz;
      out2 <= in;
      end
  end
      
endmodule
