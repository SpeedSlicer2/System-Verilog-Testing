module PC_tb;
    logic [15:0] in = 16'h0000, out;
    logic inc = 0, load = 0, reset = 0, clk = 0;
    PC pc(.in(in), .inc(inc), .load(load), .reset(reset), .clk(clk), .out(out));
    integer fd;
    task fout();
        $fdisplay(fd, "in: %b, inc: %b, load: %b, reset: %b, clk: %b, out: %b", in, inc, load, reset, clk, out);
    endtask
    task tick();
        clk = 1;
        #1;
    endtask
    task tock();
        clk = 0;
        #1;
    endtask
    initial begin
        fd = $fopen("/home/shaun/Documents/GitHub/Computa/sim/output.txt");
        $dumpvars(0, PC_tb);

        in = 0;
        reset = 0;
        load = 0;
        in = 0;
        tick();
        fout();

        tock();
        fout();

        in = 1;
        tick();
        fout();

        tock();
        fout();

        in = -32123;
        tick();
        fout();

        tock();
        fout();

        load = 1;
        tick();
        fout();

        tock();
        fout();

        load = 0;
        tick();
        fout();

        tock();
        fout();

        tick();
        fout();

        tock();
        fout();

        in = 12345;
        load = 1;
        in = 0;
        tick();
        fout();

        tock();
        fout();

        reset = 1;
        tick();
        fout();

        tock();
        fout();

        reset = 0;
        in = 1;
        tick();
        fout();

        tock();
        fout();

        reset = 1;
        tick();
        fout();

        tock();
        fout();

        reset = 0;
        load = 0;
        tick();
        fout();

        tock();
        fout();

        reset = 1;
        tick();
        fout();

        tock();
        fout();

        in = 0;
        reset = 0;
        load = 1;
        tick();
        fout();

        tock();
        fout();

        load = 0;
        in = 1;
        tick();
        fout();

        tock();
        fout();

        in = 22222;
        reset = 1;
        in = 0;
        tick();
        fout();

        tock();
        fout();
        #10;
        $fclose(fd);
        $finish;
    end
endmodule
