module Mux8
  (input logic [7:0] a, b,
    input logic sel,
   output logic [7:0] out);
  always_comb begin : Muxer
    if (sel)
        out = b;
    else 
        out = a;
  end
endmodule 