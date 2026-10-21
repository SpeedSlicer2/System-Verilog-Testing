module CPU
    (input logic[15:0] inM, instruction,
    input logic reset, clk,
    output logic[15:0] outM, addressM, pc,
    output logic writeM);
    logic loadA, loadD, loadPC;
    logic [15:0] outAReg, outDReg, inA, inD, outALU;
    
    Register16 aReg(.in(inA), .clk(clk), .load(loadA), .out(outAReg));
    Register16 dReg(.in(inD), .clk(clk), .load(loadD), .out(outDReg));

    ALU alu(.x(outDReg), .y(instruction[12] ? inM : outAReg), .zx(), .nx(), .zy(), .ny(), .f(), .no(), .out(outALU), .zr(), .ng());

    PC pcmod(.in(outAReg), .inc(), .reset(reset), .load(loadPC), .clk(clk), .out(pc));

    assign inD = outALU;
    assign outM = outALU;
    always_comb
        if(instruction[15])
        begin
          inA = outALU;
          loadA = 0;
          
        end
        else 
        begin
            inA = {1'b0, instruction[14:0]};
            loadA = 1;
        end
        
endmodule 