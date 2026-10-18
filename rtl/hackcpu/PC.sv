module PC
    (input logic inc, load, reset, clk,
    input logic [15:0] in,
    output logic [15:0] out);
    logic actualLoad;
    logic [15:0] inter;
    Register16 regs(.in(inter), .load(actualLoad), .out(out), .clk(clk));
    assign actualLoad = inc || load || reset;
    assign inter = reset ? 0 : (load ? in : (inc ? out + 1 : out)); 
endmodule