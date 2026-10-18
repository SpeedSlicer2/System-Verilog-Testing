module Register16 
    (input logic [15:0] in,
     input logic load,
     input logic clk,
     output logic [15:0] out);
     logic [15:0] block = 16'h0000;
    always_ff @(negedge clk) begin 
        if (load) begin
            block <= in;
        end
    end
    assign out = block;
endmodule