module execute(
    input clk,
    input [3:0] opcode,
    input [3:0] operand,
    input [7:0] data,
    output reg [7:0] result,
    output reg [3:0] write_addr
);

always @(posedge clk) begin
    write_addr <= operand;  // ����� ������ �������� �ּ�
    case (opcode)
        4'b0001: result <= data + 1;  // INC ���
        4'b0010: result <= data - 1;  // DEC ���
        default: result <= data;      // �⺻ ����
    endcase
end

endmodule
