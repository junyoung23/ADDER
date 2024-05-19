`timescale 1ns / 1ps

module cpu_tb;

reg clk;
reg reset;
wire [7:0] ir;  // Instruction register 출력
wire [3:0] write_addr;  // Write address 출력
wire [7:0] write_data;  // Write data 출력
wire write_en;  // Write enable 신호

// CPU 모듈 인스턴스화
cpu uut (
    .clk(clk),
    .reset(reset),
    .ir(ir),
    .write_addr(write_addr),
    .write_data(write_data),
    .write_en(write_en)
);

// 클록 생성
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 클록 주기 10ns (고속 클록)
end

// 리셋 신호 제어
initial begin
    reset = 1;
    #10 reset = 0;  // 10ns 후에 리셋 비활성화
end

// 시뮬레이션 결과 모니터링
initial begin
    $monitor("Time=%t | IR=%h | WriteAddr=%h | WriteData=%h | WriteEn=%b",
             $time, ir, write_addr, write_data, write_en);
    #100;  // 시뮬레이션 지속 시간 설정 (100ns)
    $finish;  // 시뮬레이션 종료
end

endmodule
