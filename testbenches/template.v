`timescale 1ps / 1ps

module ;

    reg clk;
    //reg rst_n;

    //Inputs
    reg ;

    //Outputs
    wire ;

    initial begin
        clk = 0;
    end
    
    (
        //.rst_n (rst_n),
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