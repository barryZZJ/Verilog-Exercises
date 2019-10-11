`timescale 1ps / 1ps

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
        .DISP(disp)
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        //test code here
        repeat(16) #(5*CLK_PERIOD)
            x = x + 1;
        $finish;
    end

endmodule