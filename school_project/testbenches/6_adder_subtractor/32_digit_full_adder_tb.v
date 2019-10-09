`timescale 1np / 1ps

module tb_module_name;

reg clk;
//reg rst_n;

//Inputs
reg cin;
reg [31:0]x, [31:0] y;

//Outputs
wire [31:0]s;
wire cout;

initial begin
    clk=0;
end

32_digit_full_adder utt
(
    //.rst_n (rst_n),
    //.clk (clk),
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) 
    clk=~clk;


initial begin
    //test code here

    $finish;
end

endmodule