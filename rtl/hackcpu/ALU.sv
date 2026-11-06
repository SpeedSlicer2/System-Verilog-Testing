module ALU
  (input logic [15:0] x, y,
  // reference of ALU from https://b1391bd6-da3d-477d-8c01-38cdf774495a.filesusr.com/ugd/44046b_f0eaab042ba042dcb58f3e08b46bb4d7.pdf
  input logic zx /* zero the x input IMPL */, 
  nx /* negate the x input IMPL */,   
  zy /* zero the y input IMPL */, 
  ny /* negate the y input IMPL */, 
  f /* function code. 1 for [add], 0 for [and] */, 
  no /* negate output */,
    output logic [15:0] out,
    output logic zr /* True iff out=0*/, ng /* True iff out<0*/); 
  logic [15:0] xParam1, xParam2;
  assign xParam1 = zx ? 16'h0000 : x;
  assign xParam2 = nx ? ~xParam1 : xParam1;
  logic [15:0] yParam1, yParam2;
  assign yParam1 = zy ? 16'h0000 : y;
  assign yParam2 = ny ? ~yParam1 : yParam1;
  logic [15:0] preout;
  assign preout = f ? yParam2 + xParam2 : xParam2 & yParam2;
  assign out = no ? ~preout : preout;
  assign zr = out == 0;
  assign ng = !out[15];
endmodule 