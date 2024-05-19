`timescale 1ns / 1ps

module cpu_tb;

reg clk;
reg reset;
wire [7:0] ir;  // Instruction register ���
wire [3:0] write_addr;  // Write address ���
wire [7:0] write_data;  // Write data ���
wire write_en;  // Write enable ��ȣ

// CPU ��� �ν��Ͻ�ȭ
cpu uut (
    .clk(clk),
    .reset(reset),
    .ir(ir),
    .write_addr(write_addr),
    .write_data(write_data),
    .write_en(write_en)
);

// Ŭ�� ����
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Ŭ�� �ֱ� 10ns (��� Ŭ��)
end

// ���� ��ȣ ����
initial begin
    reset = 1;
    #10 reset = 0;  // 10ns �Ŀ� ���� ��Ȱ��ȭ
end

// �ùķ��̼� ��� ����͸�
initial begin
    $monitor("Time=%t | IR=%h | WriteAddr=%h | WriteData=%h | WriteEn=%b",
             $time, ir, write_addr, write_data, write_en);
    #100;  // �ùķ��̼� ���� �ð� ���� (100ns)
    $finish;  // �ùķ��̼� ����
end

endmodule
