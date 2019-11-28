`timescale 1ps / 1ps

module tb_divider;

    reg clk = 1'b0;

    //Inputs
    reg [31:0] a;
    reg [31:0] b;
    reg e = 1'b1;
    reg read = 1'b1;

    //Outputs
    wire [31:0] q;
    wire [31:0] r;
    wire d;

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;
    
    divider #(32) utt (
        clk,
        e,
        read,
        a,
        b,
        q,
        r,
        d
    );

    initial begin
        //test code here
        a = 405;
        b = 5;
        repeat (10) #20 begin
            read = 1'b1;
            #20
            read = 1'b0;
            #500 //计算中
            e = 1'b0;
            #100
            e = 1'b1;
            a = a - 23;
            b = b + 5;
            read = 1'b1;
        end
        $finish;
    end

endmodule