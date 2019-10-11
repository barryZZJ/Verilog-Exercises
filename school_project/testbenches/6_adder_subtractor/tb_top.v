`timescale 1ps / 1ps

module tb_top;

    reg clk;
    //reg rst_n;

    //Inputs
    reg[3:0] a;
    reg[3:0] b;
    reg add_sub_signal;
    reg[1:0] operand_control;

    //Outputs
    wire[11:0] DISP;

    initial begin
        clk = 0;
        a = 0;
        b = 0;
        add_sub_signal = 0;
        operand_control = 0;
    end
    
    top #(1) utt
    (
        //.rst_n (rst_n),
        .CLK (clk),
        .a(a),
        .b(b),
        .add_sub_signal(add_sub_signal),
        .operand_control(operand_control),
        .DISP(DISP)
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        //test code here
        repeat(2) #500 begin //加法还是减法
            repeat(2) #500 begin //控制三种显示内容
                repeat(5) #500 begin //a, b值的变化
                    a = a + 5;
                    b = b + 1;
                end
                operand_control = operand_control + 1;
            end
            add_sub_signal = 1;
        end

        $finish;
    end

endmodule