module cpu_tb;
    reg clk, reset;
    wire [7:0] ir;

    // CPU ��� �ν��Ͻ�ȭ
    cpu uut (
        .clk(clk),
        .reset(reset),
        .ir(ir)
    );

    // Ŭ�� ����
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns �ֱ��� Ŭ��
    end

    // ���� �� �ùķ��̼� ����
    initial begin
        reset = 1;
        #10 reset = 0;
        #1000 $finish;
    end

    // �ùķ��̼� ���� ����͸�
    initial begin
        $monitor("Time=%t | PC=%h | IR=%h | RegFile[0]=%h | RegFile[1]=%h | RegFile[2]=%h | RegFile[3]=%h | RegFile[4]=%h", 
                  $time, uut.pc, uut.ir, uut.regfile[0], uut.regfile[1], uut.regfile[2], uut.regfile[3], uut.regfile[4]);
    end
endmodule
