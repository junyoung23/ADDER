module fetch(
    input clk,
    input reset,
    input [7:0] pc,
    output reg [7:0] instruction
);
    reg [7:0] memory [0:255];
    integer i;

    initial begin
        // 메모리 초기화
        memory[0] = 8'b00010001; // opcode 1, operand 1
        memory[1] = 8'b00100010; // opcode 2, operand 2
        memory[2] = 8'b00010001; // opcode 1, operand 1
        memory[3] = 8'b00100010; // opcode 2, operand 2
        for (i = 4; i < 256; i = i + 1) begin
            memory[i] = 8'b00000000; // 기본값으로 초기화
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            instruction <= 8'b00000000;
        end else begin
            instruction <= memory[pc];
        end
    end
endmodule
