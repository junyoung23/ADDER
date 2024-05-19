module cpu(
    input clk,
    input reset,
    output reg [7:0] ir = 0,  // 초기값 0으로 설정
    output reg [3:0] o_write_addr = 0,  // 초기값 0
    output reg [7:0] o_write_data = 0  // 초기값 0
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
            ir <= 0;  // 리셋 시 IR 초기화
            o_write_addr <= 0;  // 리셋 시 Write Address 초기화
            o_write_data <= 0;  // 리셋 시 Write Data 초기화
        end else begin
            pc <= pc + 1;
            ir <= instruction;  // 새 명령어로 IR 업데이트
            if (write_enable) begin
                regfile[write_addr] <= execute_result;
                o_write_addr <= write_addr;  // 실행 결과에 따라 Write Address 업데이트
                o_write_data <= execute_result;  // 실행 결과를 Write Data로 업데이트
            end
            write_enable <= 1; // 다음 사이클에서 레지스터 쓰기 활성화
        end
    end

endmodule
