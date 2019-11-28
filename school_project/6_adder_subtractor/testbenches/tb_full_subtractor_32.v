`timescale 1ps / 1ps

module tb_full_subtractor_32;

    //Inputs
    reg [31:0] x;
    reg [31:0] y;

    //Outputs
    wire [31:0]s;

    initial begin
        x = 32'b0;
        y = 32'b0;
    end

    full_subtractor_32 utt
    (
        .x(x),
        .y(y),
        .s(s)
    );

    initial begin
        repeat(10) #5 begin
            x = x+5;
            y = y+1;
        end

        $finish;
    end

endmodule