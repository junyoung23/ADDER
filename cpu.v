module cpu(
    input clk,
    input reset,
    output reg [7:0] ir = 0,  // �ʱⰪ 0���� ����
    output reg [3:0] o_write_addr = 0,  // �ʱⰪ 0
    output reg [7:0] o_write_data = 0  // �ʱⰪ 0
);
    reg [7:0] pc = 0;
    wire [7:0] instruction;
    wire [3:0] opcode, operand;
    reg [7:0] regfile[0:15];
    wire [7:0] execute_result;
    wire [3:0] write_addr;
    reg write_enable;

    fetch fetch_unit(
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instruction(instruction)
    );

    decode decode_unit(
        .instruction(instruction),
        .opcode(opcode),
        .operand(operand)
    );

    execute execute_unit(
        .clk(clk),
        .opcode(opcode),
        .operand(operand),
        .data(regfile[operand]),
        .result(execute_result),
        .write_addr(write_addr)
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 0;
            write_enable <= 0;
            ir <= 0;  // ���� �� IR �ʱ�ȭ
            o_write_addr <= 0;  // ���� �� Write Address �ʱ�ȭ
            o_write_data <= 0;  // ���� �� Write Data �ʱ�ȭ
        end else begin
            pc <= pc + 1;
            ir <= instruction;  // �� ��ɾ�� IR ������Ʈ
            if (write_enable) begin
                regfile[write_addr] <= execute_result;
                o_write_addr <= write_addr;  // ���� ����� ���� Write Address ������Ʈ
                o_write_data <= execute_result;  // ���� ����� Write Data�� ������Ʈ
            end
            write_enable <= 1; // ���� ����Ŭ���� �������� ���� Ȱ��ȭ
        end
    end

endmodule
