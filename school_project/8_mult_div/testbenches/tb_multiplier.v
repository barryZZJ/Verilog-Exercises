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
        a = 0;
        b = 0;
        repeat (10) #20 begin
            read = 1'b1;
            #20
            read = 1'b0;
            #500 //计算中
            // rst = 1'b1;
            // #5
            // rst = 1'b0;
            e = 1'b0;
            #50
            e=1'b1;
            a = a + 5;
            b = b + 2;
            read = 1'b1;
        end
        $finish;
    end

endmodule