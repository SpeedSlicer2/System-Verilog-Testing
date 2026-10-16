module AndGate_tb;
    logic[7:0] a, b, out;
    And8 andGate(.a(a), .b(b), .out(out));
    integer fd;

    initial begin
        fd = $fopen("/home/shaun/Documents/GitHub/Computa/sim/output.txt");
        $dumpvars(0, AndGate_tb);
    	a = 8'b11001100;
    	b = 8'b10101010;
        #10;
        $fdisplay(fd, "a: %b, b: %b, output: %b", a, b, out);
        $fclose(fd);
        $finish;
    end
endmodule
