module fetch(
    input clk,
    input reset,
    input [7:0] pc,
    output reg [7:0] instruction,
    output reg [7:0] next_pc
);

// 메모리 정의 (임시로 명령어 저장)
reg [7:0] memory[0:255];

initial begin
    memory[0] = 8'b00010001; // 예: opcode 1, operand 1
    memory[1] = 8'b00100010; // 예: opcode 2, operand 2
    // 메모리 초기화 등
end

always @(posedge clk) begin
    if (reset) begin
        next_pc <= 0;
    end else begin
        instruction <= memory[pc]; // 메모리에서 명령어 읽기
        next_pc <= pc + 1;         // 다음 명령어 주소 계산
    end
end

endmodule
