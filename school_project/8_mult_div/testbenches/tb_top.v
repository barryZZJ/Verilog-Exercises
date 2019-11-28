`timescale 1ps / 1ps

module tb_top;

    localparam FREQ = 10;
    localparam INTERVAL=FREQ*8;
    localparam T40MS = 1;

    reg clk;

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    //Inputs
    reg [15:0] sw;
    reg btna;
    reg btnb;
    reg mult_div;
    reg calc;
    reg rst;

    //Outputs
    wire lda;
    wire ldb;
    wire ldcalc;
    wire ldmd;
    wire [11:0] DISP;
    // //DEBUG
    // wire [31:0] mult_s;
    // wire flga;
    // wire flgcalc;
    // wire flgmult;
    // wire [15:0] a;
    // wire [15:0] b;
    // wire em;
    // wire ed;
    // wire flg_should_read;
    // wire read;
    // wire done;
    // wire btna_d;
    // wire btnb_d;
    // wire mult_div_d;
    // wire calc_d;
    // wire rst_d;
    // wire [11:0] DISPb;

    initial begin
        clk = 0;
        sw = 16'h0005;
        btna = 1'b0;
        btnb = 1'b0;
        mult_div = 1'b0;
        calc = 1'b0;
        rst = 1'b0;
    end
    
    top #(FREQ, INTERVAL, T40MS) utt (
        clk,
        sw,
        btna,
        btnb,
        mult_div,
        calc,
        rst,
        lda,
        ldb,
        ldcalc,
        ldmd,
        DISP
        // //TODO Debug
        // mult_s,
        // flga,
        // flgcalc,
        // flgmult,
        // a,
        // b,
        // em,
        // ed,
        // flg_should_read,
        // read,
        // done,
        // btna_d,
        // btnb_d,
        // mult_div_d,
        // calc_d,
        // rst_d,
        // DISPb
    );



    initial begin
        //test code here
        repeat (2)begin

            //a
            sw = 16'h001f;
            #(CLK_PERIOD*FREQ*12)
            btnb = 1'b1;
            #(CLK_PERIOD*4)
            btnb = 1'b0;
            #(CLK_PERIOD*4)

            sw = 16'h001f; //输入b

            #(CLK_PERIOD*FREQ*12)

            calc = 1'b1;
            #(CLK_PERIOD*4)
            calc = 1'b0;

            #(CLK_PERIOD*20); //计算加显示结果时间
            #(CLK_PERIOD*INTERVAL*4);

            rst = 1'b1;
            #(CLK_PERIOD*4)
            rst = 1'b0;
            #(CLK_PERIOD*4)

            sw = 16'h0005; //输入a

        end
        $finish;
    end

endmodule