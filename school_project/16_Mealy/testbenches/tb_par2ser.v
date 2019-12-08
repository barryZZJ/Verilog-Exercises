`timescale 1ps / 1ps

module tb_par2ser;
reg clk;
reg rst;
reg read;
reg [7:0] din;

wire dout;
// wire [7:0] mem;
 
par2ser utt(
    din,
    read,
    rst,
    clk,
    dout
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    clk = 1'b0;
    rst = 1'b1;
    read = 1'b1;
    din = 8'b1101_1010;
end

initial begin
    #CLK_PERIOD
    rst = 1'b0;
    #(CLK_PERIOD*2)
    read = 1'b0;
    #(CLK_PERIOD*10)
    $finish;
end

endmodule