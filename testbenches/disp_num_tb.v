`timescale  1ns / 1ps

module test;
    parameter PERIOD  = 10;
    
    reg clk;
    wire[11:0] disp;

    parameter interval = 10;
    integer counter = 0;
    reg[3:0] num=0;
    reg[3:0] posb=4'b0111;
    reg dp = 0;

    initial
        clk=0;

    always #(PERIOD/2) 
        clk=~clk;

    display_num #(interval) utt(clk, posb, num, dp, disp);

    always @(posedge clk) begin
        counter <= counter + 1;
        if(counter == interval) begin
            counter <= 0;
            num <= num + 1;
        end
    end


    initial #2000
        $finish;

endmodule

   
    