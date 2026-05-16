/* 
ALU Module using Risc V: RV32I ISA 
Authored by: Drew Balducci
*/

typedef enum logic[3:0] {ADD, SUB, AND, OR, XOR, SLL, SRL, SRA, SLT, SLTU} alu_operations_t;
module ALU(
    input alu_operations_t [3:0] operation,
    input logic [31:0] in1,
    input logic [31:0]  in2,
    output logic [31:0] result
);
    always_comb begin
        case(operation)
            ADD:    result = in1 + in2;
            SUB:    result = in1 - in2;
            AND:    result = in1 & in2;
            OR:     result = in1 | in2;
            XOR:    result = in1 ^ in2;
            SLL:    result = in1 << in2[4:0];
            SRL:    result = in1 >> in2[4:0];
            SRA:    result = in1 >>> in2[4:0];
            SLT:    result = ( $signed(in1) < $signed(in2) ) ? 32'b1 : 32'b0;
            SLTU:   result = ( in1 < in2 ) ? 32'b1 : 32'b0;
            default: result = 32'bx;
        endcase
    end
endmodule