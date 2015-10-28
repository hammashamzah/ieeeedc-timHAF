fine WIDTH 16
`define THRESHOLD 16'b1000000000000000 //32768

module Quantitation_1bit(in,out);
  input   [`WIDTH-1:0] in;
  output  out;
  assign out = (in>=`THRESHOLD) ? 1:0;
endmodule


