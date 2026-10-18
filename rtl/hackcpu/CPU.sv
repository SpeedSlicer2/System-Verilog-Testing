module CPU
    (input logic[15:0] inM, instruction,
    input logic reset,
    output logic[15:0] outM, addressM, pc,
    output logic writeM);
    shortint pcInstruction = 0; 
    
endmodule 
// 11a cccc ccdd djjj