module execute(
    input clk,
    input [3:0] opcode,
    input [3:0] operand,
    inout [7:0] regfile[0:15]
);

always @(posedge clk) begin
    case (opcode)
        4'b0001: regfile[operand] <= regfile[operand] + 1; // INC
        4'b0010: regfile[operand] <= regfile[operand] - 1; // DEC
        // 추가 명령어 처리
    endcase
end

endmodule
