`timescale 1ns / 1ps

module tb_full_adder_32;

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
        clk = 0;
        cin = 0;
        x = 32'b0;
        y = 32'b0;
    end

    full_adder_32 utt
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
        repeat(10) #5 begin
            x = x+1;
            y = y+5;
        end

        $finish;
    end

endmodule