`timescale 1ps / 1ps
//数码管显示测试
module tb_display;

    reg clk;
    //reg rst_n;

    //Inputs
    reg[15:0] x;

    //Outputs
    wire[11:0] disp;

    initial begin
        clk = 0;
        x = 0;
    end
    
    display_16bto4h #(1) utt
    (
        .CLK(clk),
        .x(x),
        .neg(4'b0),
        .DISP(disp)
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        repeat(16) #(15*CLK_PERIOD)
            x = x + 1;
        $finish;
    end

endmodule