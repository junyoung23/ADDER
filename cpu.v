module cpu(
    input clk,
    input reset,
    output reg [7:0] ir
);
    reg [7:0] pc;
    wire [7:0] instruction;
    wire [3:0] opcode, operand;
    reg [7:0] regfile [0:15];
    wire [7:0] execute_result;
    integer i;

    // Fetch module instance
    fetch f0(
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instruction(instruction)
    );

    // Decode module instance
    decode d0(
        .instruction(instruction),
        .opcode(opcode),
        .operand(operand)
    );

    // Execute module instance
    execute e0(
        .clk(clk),
        .opcode(opcode),
        .operand(operand),
        .data(regfile[operand]),
        .result(execute_result)
    );

    // Control logic and register file update
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 0;
            ir <= 0;
            for (i = 0; i < 16; i = i + 1) begin
                regfile[i] <= 0;
            end
        end else begin
            ir <= instruction; // Update IR
            pc <= pc + 1;
            if (opcode == 4'b0001 || opcode == 4'b0010) begin
                regfile[operand] <= execute_result;
            end
        end
    end
endmodule
