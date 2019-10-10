`timescale 1ns / 1ps

module tb_mux4to1_module;

reg [2:0] a;
reg [2:0] b;
reg [2:0] c;
reg [2:0] d;
reg [1:0] s;
wire [2:0] y;

reg [2:0] w0;
reg [2:0] w1;
reg [2:0] w2;
reg [2:0] w3;
reg [1:0] s;
wire [2:0] f;

initial begin
    w0 = 3'b001;
    w1 = 3'b010;
    w2 = 3'b011;
    w3 = 3'b100;
    s = 2'b00;
end

mux4to1_module utt
(
    .s(s),
    .w0(w0),
    .w1(w1),
    .w2(w2),
    .w3(w3),
    .f(f)
);

initial begin
    repeat(2)begin
        #5 s=2'b01;
        #5 s=2'b10;
        #5 s=2'b11;
        #5
        $finish;
    end
end

always #5 begin
    w0 = w0 + 1;
    w1 = w1 + 1;
    w2 = w2 + 1;
    w3 = w3 + 1;
end

endmodule