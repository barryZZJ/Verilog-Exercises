`timescale 1ps / 1ps

module tb_main;

    reg clk;
    reg rst;

    //Inputs
    reg [7:0] din;
    reg read;
    reg btnclk;
    parameter T50MS = 0;

    //Outputs
    wire ldclk;
    wire ldres;
    wire ldrst;

    // wire X;
    // wire Y;
    // wire [1:0] curr_state;
    // wire [1:0] next_state;

    initial begin
        din = 8'b1101_1010;
        btnclk = 1'b0;
        clk = 1'b0;
        rst = 1'b1;
    end
    
    main #(T50MS) utt (
        din,
        read,
        rst,
        clk,
        btnclk,
        ldrst,
        ldclk,
        ldres
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        //test code here
        read = 1'b1;
        #3
        rst = 1'b0;
        repeat (2*2) #(2*CLK_PERIOD)
            btnclk = ~btnclk;
        read = 1'b0;
        #3
        repeat(9*2) #(3*CLK_PERIOD)
            btnclk = ~btnclk;
        #10

        $finish;
    end

endmodule