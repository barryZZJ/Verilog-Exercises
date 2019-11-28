`timescale 1ps / 1ps

module tb_module_name;


    //module_name Input ports
    reg w0;
    reg w1;
    reg s;

    //module_name Output ports
    wire f;

    initial begin
        s = 1'b0;
        w0 = 1'b0;
        w1 = 1'b1;
    end

    //instantiate test module
    mux2to1_design utt
    (
        .w0(w0),
        .w1(w1),
        .s(s),
        .f(f)
    );

    initial begin
        #5
        w0 = 1'b1;
        #5
        s = 1'b1;
        #5
        w1 = 1'b1;
        #5
        $finish; //end simulation
    end

endmodule