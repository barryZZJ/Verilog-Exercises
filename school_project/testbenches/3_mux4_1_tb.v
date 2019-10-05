`timescale 1ns / 1ps

module tb_mux4_1;
reg clk;

reg [2:0] a;
reg [2:0] b;
reg [2:0] c;
reg [2:0] d;
reg [1:0] s;
wire [2:0] y;

mux4_1 utt
(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .s(s),
    .y(y)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    clk<=1'b1;
    a<=3'b001;
    b<=3'b010;
    c<=3'b011;
    d<=3'b100;
    s<=0;
end

initial begin
    repeat(2)begin
        #1 s=0;
        #5 s=1;
        #10 s=2;
        #15 s=3;
        #5
        $finish;
    end
end

always #2 begin
    a = a + 1;
    b = b + 1;
    c = c + 1;
    d = d + 1;
end

endmodule