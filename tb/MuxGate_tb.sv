module MuxGate_tb;
    logic[7:0] a, b, out;
    logic sel;
    Mux8 mux(.a(a), .b(b), .sel(sel), .out(out));
    integer fd;
    task runMuxTest(input logic[7:0] aSet, bSet, input logic selSet);
        a=aSet;
        b=bSet;
        sel=selSet;
        #10;
        $fdisplay(fd, "a: %b, b: %b, output: %b", a, b, out);
    endtask
    initial begin
        $dumpvars(0, MuxGate_tb);
    	runMuxTest(8'b00000000, 8'b11111111, 0);
        runMuxTest(8'b00000000, 8'b11111111, 1);
        runMuxTest(8'b11010100, 8'b01100011, 0);
        runMuxTest(8'b11010100, 8'b01100011, 1);
        $finish;
    end
endmodule
