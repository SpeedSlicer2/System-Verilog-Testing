module Register8
  (input logic [7:0] data,
  input logic clock,
   output logic [7:0] out);
  always_ff @( posedge clock ) begin : Reg
     out <= data;
  end
endmodule 