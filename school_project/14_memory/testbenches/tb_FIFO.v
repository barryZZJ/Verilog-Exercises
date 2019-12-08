`timescale 1ps / 1ps

module tb_FIFO;

    reg clk;
    //reg rst_n;

    //Inputs
    reg [7:0] data_in;
    reg wr_en;
    reg rd_en;
    reg rst;

    //Outputs
    wire [7:0] data_out;
    wire empty;
    wire full;
    //TODO
    // wire [3:0] i;

    initial begin
        clk = 0;
    end
    
    FIFO #(8, 8) utt(
        data_in,
        wr_en,
        rd_en,
        clk,
        rst,
        data_out,
        empty,
        full
        // i
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        //test code here
        rst = 1'b1; //初始化
        #(CLK_PERIOD*2);
        //------------------------------
        //正常存取
        rst = 1'b0;
        wr_en = 1'b1;
        data_in = 8'h0_1;

        repeat (9) #CLK_PERIOD
            data_in = data_in + 1;

        #CLK_PERIOD;

        wr_en = 1'b0;
        rd_en = 1'b1;

        #(CLK_PERIOD*9);
        //------------------------------
        //测试同时独写
        rst = 1'b1; //初始化
        #(CLK_PERIOD*2);
        rst = 1'b0;
        
        wr_en = 1'b1;
        rd_en = 1'b0;

        data_in = 8'h0_1;
        repeat (3) #CLK_PERIOD
            data_in = data_in + 1;
        
        rd_en = 1'b1;

        repeat (6) #CLK_PERIOD
            data_in = data_in + 1;
        
        wr_en = 1'b0;

        #(CLK_PERIOD*4);

        //------------------------------
        //测试复位
        rst = 1'b0;
        wr_en = 1'b1;
        rd_en = 1'b0;
        data_in = 8'h0_1;

        repeat (9) #CLK_PERIOD
            data_in = data_in + 1;

        #CLK_PERIOD;

        wr_en = 1'b0;
        rd_en = 1'b1;

        #(CLK_PERIOD*4);

        rst = 1'b1;
        #(CLK_PERIOD*2);

        rst = 1'b0;
        #(CLK_PERIOD*2);


        $finish;
    end

endmodule