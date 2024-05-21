module execute(
    input clk,
    input [3:0] opcode,
    input [3:0] operand,
    input [7:0] data,
    output reg [7:0] result
);
    always @(posedge clk) begin
        case (opcode)
            4'b0001: result <= data + 1; // 예시: 레지스터 증가
            4'b0010: result <= data - 1; // 예시: 레지스터 감소
            default: result <= data;
        endcase
    end
endmodule
