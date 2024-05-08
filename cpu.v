`timescale 1ns / 1ps

module cpu(
    input clk,
    input reset
);
reg [7:0] pc = 0;
wire [7:0] next_pc;
wire [7:0] instruction;
wire [3:0] opcode, operand;
reg [7:0] regfile[0:15];

// 모듈 인스턴스
fetch f0(
    .clk(clk),
    .reset(reset),
    .pc(pc),
    .instruction(instruction),
    .next_pc(next_pc)
);

decode d0(
    .instruction(instruction),
    .opcode(opcode),
    .operand(operand)
);

execute e0(
    .clk(clk),
    .opcode(opcode),
    .operand(operand),
    .regfile(regfile)
);

always @(posedge clk) begin
    if (reset) begin
        pc <= 0;
    end else begin
        pc <= next_pc; // PC 업데이트
    end
end

endmodule
