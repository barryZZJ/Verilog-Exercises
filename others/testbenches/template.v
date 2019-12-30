`timescale 1ps / 1ps

module ;

    reg clk;
    //reg rst;

    //Inputs
    reg ;

    //Outputs
    wire ;

    initial begin
        clk = 0;
    end
    
     (
        //.rst (rst),
        //.clk (clk),
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        //test code here

        $finish;
    end

endmodule