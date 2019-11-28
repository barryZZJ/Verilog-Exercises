//四选一选择器，
//调用已分配好电路图的block design实现（design名为mux4to1_design）
`timescale 1ps / 1ps
module tb_mux4to1_design;

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

mux4to1_design utt
(
    .s0(s[0]),
    .s1(s[1]),
    .w0(w0),
    .w1(w1),
    .w2(w2),
    .w3(w3),
    .f(f)
);

initial begin
    repeat(2)begin
        #10 s=2'b01;
        #10 s=2'b10;
        #10 s=2'b11;
    end
    $finish;
end

always #5 begin
    w0 = w0 + 1;
    w1 = w1 + 1;
    w2 = w2 + 1;
    w3 = w3 + 1;
end

endmodule 
TabNine::config