module fetch(
    input clk,
    input reset,
    input [7:0] pc,
    output reg [7:0] instruction
);

reg [7:0] memory[0:255]; // ������ �޸�

initial begin
    // �޸𸮿� ��ɾ� ���� �ε�
    memory[0] = 8'b00010001; // ���� ��ɾ�
    memory[1] = 8'b00100010;
    // �߰����� �޸� �ʱ�ȭ �ʿ�� ���⿡ �ۼ�
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        instruction <= 0; // ���� �� ��ɾ� Ŭ����
    end else begin
        instruction <= memory[pc]; // ���� PC���� ��ɾ� �б�
    end
end

endmodule
