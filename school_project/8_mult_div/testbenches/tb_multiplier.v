`timescale 1ps / 1ps

module tb_multiplier;

    reg clk = 1'b0;

    //Inputs
    reg [31:0] a;
    reg [31:0] b;
    reg e = 1'b1;
    reg read = 1'b1;

    //Outputs
    wire [63:0] s;
    wire d;

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;
    
    multiplier #(32) utt (
        clk,
        e,
        read,
        a,
        b,
        s,
        d
    );

    initial begin
        //test code here
        a = 5;
        b = 5;
        repeat (2) #CLK_PERIOD begin
            read = 1'b1;
            #CLK_PERIOD
            read = 1'b0;
            #(33*CLK_PERIOD) //计算中，需要32个时钟周期才能计算完
            e = 1'b0;
            //计算完成，修改操作数进行下一次计算
            #CLK_PERIOD
            e=1'b1;
            a = a + 5;
            b = b + 2;
            read = 1'b1;
        end
        $finish;
    end

endmodule