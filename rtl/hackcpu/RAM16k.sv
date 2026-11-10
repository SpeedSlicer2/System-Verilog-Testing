module RAM16k 
    (input logic [15:0] in,
     input logic [13:0] address,
     input logic load,
     input logic clk,
     output logic [15:0] out); 
     logic [15:0] block [0:16383];
    always_ff @(posedge clk) begin 
        if (load) begin
            block[address] <= in;
        end
    end
    assign out = block;
endmodule