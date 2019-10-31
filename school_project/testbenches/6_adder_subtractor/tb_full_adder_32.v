`timescale 1ps / 1ps

module tb_full_adder_32;

    //Inputs
    reg cin;
    reg [31:0] x;
    reg [31:0] y;

    //Outputs
    wire [31:0]s;
    wire cout;

    initial begin
        cin = 0;
        x = 32'b0;
        y = 32'b0;
    end

    full_adder_32 utt
    (
        .cin(cin),
        .x(x),
        .y(y),
        .s(s)
    );

    initial begin
        repeat(10) #5 begin
            x = x+1;
            y = y+5;
        end

        $finish;
    end

endmodule