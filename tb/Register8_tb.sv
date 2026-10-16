module Register8_tb;
    byte a, out;
    logic clk;
    integer fd;
    Register8 regi(.data(a), .clock(clk), .out(out));
    task test(input byte value);
        assign a = value;
        #1
        assign clk = 1;
        #1
        assign clk = 0;
    endtask
    initial begin
        $dumpvars(0, Register8_tb);
        test(1);
        test(2);
        test(3);
        test(50);
        $finish;
    end
endmodule
