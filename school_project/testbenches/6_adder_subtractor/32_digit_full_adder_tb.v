`timescale 1np / 1ps

module tb_module_name;

    reg clk;
    //reg rst_n;

    //Inputs
    reg cin;
    reg [31:0] x;
    reg [31:0] y;

    //Outputs
    wire [31:0]s;
    wire cout;

    initial begin
        clk=0;
        cin = 0;
        x = 32'b0;
        y = 32'b0;
    end

    32_digit_full_adder utt
    (
        //.rst_n (rst_n),
        //.clk (clk),
        .cin(cin),
        .x(x),
        .y(y),
        .s(s),
        .cout(cout)
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;


    initial begin
        //test code here

        $finish;
    end

endmodule