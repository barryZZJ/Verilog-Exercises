`timescale 1ps / 1ps

module tb_main;

    reg clk;
    reg rst;

    //Inputs
    reg [7:0] din;
    reg btnclk;
    reg btn0;
    reg btn1;
    reg btn2;
    reg btn3;

    //Outputs
    wire [7:0] lddin;
    wire ldbtn;
    wire ldpass;
    wire ldfail;

    initial begin
        clk = 0;
        btnclk = 1'b0;
        btn0 = 1'b0;
        btn1 = 1'b0;
        btn2 = 1'b0;
        btn3 = 1'b0;
    end
    
    main #(0) utt (
        din,
        clk,
        rst,
        btnclk,
        btn0,
        btn1,
        btn2,
        btn3,
        lddin,
        ldbtn,
        ldpass,
        ldfail
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;
    
    task down;
        output btn;
            btn = 1'b1;
    endtask

    task up;
        output btn;
            btn = 1'b0;
    endtask

    initial begin
        din = {2'b00, 2'b01, 2'b10, 2'b11}; //设置密码为0123
        rst = 1'b1;

        #CLK_PERIOD
        //初始化，设置密码为0123
        down(btnclk);
        #CLK_PERIOD
        up(btnclk);

        #CLK_PERIOD
        rst = 1'b0;

        #CLK_PERIOD

        //输入正确密码0123
        down(btn0);
		#CLK_PERIOD;
		up(btn0);
        #CLK_PERIOD

        down(btn1);
		#CLK_PERIOD;
		up(btn1);
        #CLK_PERIOD

        down(btn2);
		#CLK_PERIOD;
		up(btn2);
        #CLK_PERIOD

        down(btn3);
		#CLK_PERIOD;
		up(btn3);
        #CLK_PERIOD

//------------------------------
        //重置
        rst = 1'b1;
        #CLK_PERIOD
        
        down(btnclk);
		#CLK_PERIOD;
		up(btnclk);
        
        #CLK_PERIOD
        rst = 1'b0;

        #CLK_PERIOD

        //输入错误密码0133
        down(btn0);
		#CLK_PERIOD;
		up(btn0);
        #CLK_PERIOD

        down(btn1);
		#CLK_PERIOD;
		up(btn1);
        #CLK_PERIOD

        down(btn3);
		#CLK_PERIOD;
		up(btn3);
        #CLK_PERIOD

        down(btn3);
		#CLK_PERIOD;
		up(btn3);
        #CLK_PERIOD

        $finish;
    end

endmodule