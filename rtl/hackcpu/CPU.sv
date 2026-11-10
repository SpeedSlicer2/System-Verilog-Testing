module CPU
    (input logic[15:0] inM, instruction,
    input logic reset, clk,
    output logic[14:0] addressM, pc,
    output logic[15:0] outM,
    output logic writeM);
    logic loadA, loadD, loadPC;
    logic [15:0] outAReg, outDReg, inA, inD, outALU, interpc;
    
    logic[5:0] c;
    logic [2:0] jmp;
    logic [2:0] dst;
    logic zr, ng;
    Register16 aReg(.in(inA), .clk(clk), .load(loadA), .out(outAReg));
    Register16 dReg(.in(inD), .clk(clk), .load(loadD), .out(outDReg));

    ALU alu(.x(outDReg), .y(instruction[12] ? inM : outAReg), .zx(c[5]), .nx(c[4]), .zy(c[3]), .ny(c[2]), .f(c[1]), .no(c[0]), .out(outALU), .zr(zr), .ng(ng));

    PC pcmod(.in(outAReg), .inc(!loadPC & !reset), .reset(reset), .load(loadPC), .clk(clk), .out(interpc));
    assign dst = instruction[5:3];
    assign inA = (dst[2] & instruction[15]) ? outALU : {1'b0, instruction[14:0]}; 
    assign loadA = (dst[2] & instruction[15]) | !instruction[15];
    assign inD = outALU;
    assign loadD = (dst[1] & instruction[15]);
    assign outM = outALU;
    assign c = instruction[11:6];
    assign jmp = instruction[2:0];
    assign addressM = outAReg[14:0];
    assign pc = interpc[14:0];
    assign writeM = instruction[15] & dst[0];
    assign loadPC = instruction[15] & ((!zr & !ng & jmp[0]) | (zr & jmp[1]) | (ng & jmp[2]));
endmodule 