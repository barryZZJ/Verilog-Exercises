`timescale 1ps / 1ps

module tb_system_adder_32;

    reg clk;
    //reg rst_n;

    //Inputs
    reg [31:0] x;
    reg [31:0] y;
    reg cin;

    //Outputs
    wire [31:0] s;

    initial begin
        clk = 0;
        x = 32'b111;
        y = 32'b101;
        cin = 0;
    end
    
    system_adder_32 utt(
        //.rst_n (rst_n),
        .CLK (clk),
        .x(x),
        .y(y),
        .cin(cin),
        .s(s)
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        //test code here
        repeat (10) #500 begin
            x = x + 500;
            y = y + 100;
        end
        $finish;
    end

endmodule