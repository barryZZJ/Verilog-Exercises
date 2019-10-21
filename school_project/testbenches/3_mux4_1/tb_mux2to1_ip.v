`timescale 1ps / 1ps

module tb_mux2to1_ip;

    reg s;
    reg [1:0] w;

    wire f;

    mux2to1_ip utt
    (
        .s(s),
        .w(w),
        .f(f)
    );

    initial begin
        s = 1'b0;
        w = 2'b10;
    end

    initial begin
        #5
        w = 2'b01;
        #5
        s = 1'b1;
        #5
        w = 2'b11;
        #5
        w = 2'b01;
        #5
        $finish; //end simulation
    end
endmodule // 