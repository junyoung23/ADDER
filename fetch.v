module fetch(
    input clk,
    input reset,
    input [7:0] pc,
    output reg [7:0] instruction
);

reg [7:0] memory[0:255]; // 가상의 메모리

initial begin
    // 메모리에 명령어 사전 로드
    memory[0] = 8'b00010001; // 예시 명령어
    memory[1] = 8'b00100010;
    // 추가적인 메모리 초기화 필요시 여기에 작성
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        instruction <= 0; // 리셋 시 명령어 클리어
    end else begin
        instruction <= memory[pc]; // 현재 PC에서 명령어 읽기
    end
end

endmodule
