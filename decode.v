module decode(
    input [7:0] instruction,
    output reg [3:0] opcode,
    output reg [3:0] operand
);
    always @(*) begin
        opcode = instruction[7:4];
        operand = instruction[3:0];
    end
endmodule
