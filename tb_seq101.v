`timescale 1ns/1ps

module tb_seq101;
reg clk;
reg rst;
reg x;
wire y;

seq101 uut(
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
);
initial begin
    $dumpfile("seq101.vcd");
    $dumpvars(0, tb_seq101);
end

always #5 clk=~clk;
initial begin
    clk =0;
    rst=1;
    x=0;
    #10;
    rst=0;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;

    x = 1; #10;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    #20;
    $finish;


end

    
endmodule 

