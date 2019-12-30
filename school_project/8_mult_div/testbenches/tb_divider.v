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
        repeat (2) #CLK_PERIOD begin
            read = 1'b1;
            #CLK_PERIOD
            read = 1'b0;
            #(33*CLK_PERIOD) //计算中
            e = 1'b0;
            //计算完成，修改操作数，进行下一次计算
            #CLK_PERIOD
            e = 1'b1;
            a = a - 23;
            b = b + 5;
            read = 1'b1;
        end
        $finish;
    end

endmodule