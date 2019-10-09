`timescale 1ns / 1ps

module full_subtractor_32_tb;

    reg clk;
    //reg rst_n;

    //Inputs
    reg [31:0] x;
    reg [31:0] y;

    //Outputs
    wire [31:0]r;

    initial begin
        clk=0;
        
        x = 32'b0;
        y = 32'b0;
    end

    full_subtractor_32 utt
    (
        //.rst_n (rst_n),
        //.clk (clk),
        .x(x),
        .y(y),
        .r(r)
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;


    initial begin
        //test code here
        repeat(10) #5 begin
            x = x+5;
            y = y+1;
        end

        $finish;
    end

endmodule