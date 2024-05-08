module decode(
    input [7:0] instruction,
    output [3:0] opcode,
    output [3:0] operand
);

assign opcode = instruction[7:4];
assign operand = instruction[3:0];

endmodule