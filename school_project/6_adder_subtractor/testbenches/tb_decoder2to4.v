`timescale 1ps / 1ps

module tb_decoder2to4;

    //Inputs
    reg[1:0] x;

    //Outputs
    wire[3:0] y;

    initial begin
        x=0;
    end
    
    decoder2to4 utt(
        x,
        y
    );

    initial begin
        //test code here
        repeat(4)#1
            x = x+1;
        $finish;
    end

endmodule