`timescale 1ps / 1ps

module tb_decoder2to4;

    reg clk;
    //reg rst_n;

    //Inputs
    reg[1:0] x;

    //Outputs
    wire[3:0] y;

    initial begin
        clk = 0;
        x=0;
    end
    
    decoder2to4 utt(
        x,
        y
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        //test code here
        repeat(4)#1
            x = x+1;
        $finish;
    end

endmodule