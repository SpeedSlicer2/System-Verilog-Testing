module Computer
    (input logic reset,
    input logic [15:0] rom [0:32767]);
    logic clock;
    logic [15:0] ramOut, memoryOut;
    logic [14:0] ramAddress;
    logic [14:0] pc;
    logic writemem;
    RAM16k ram(.in(memoryOut), .address(ramAddress[13:0]), .load(writemem), .clk(clock), .out(ramOut));
    CPU cpu(.clk(clock), .inM(ramOut), .instruction(rom[pc[14:0]]), .reset(reset), .outM(memoryOut), .addressM(ramAddress), .pc(pc), .writeM(writemem));
endmodule 