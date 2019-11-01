//3)
//编写顶层模块将加减法器模块和7段数码管显示模块连接起来，
//将SW15~SW12作为第一操作数低4位，SW11~SW8作为第二操作数低4位，
//注意，a,b代表两个操作数低四位，因此第四位不算符号位
//SW0=0（1）时做加（减）法，SW0对应add_sub_signal
//结果为负数时小数点亮
//添加选择控制SW1~SW2，能选择将操作数1或操作数2或结果显示在7段数码管上。 //sw1~sw2对应operand_control

`timescale 1ps / 1ps

module tb_top;

    reg clk;

    //Inputs
    reg[3:0] a; //sw15~sw12
    reg[3:0] b; //sw11~sw8
    reg add_sub_signal; //sw0
    reg[1:0] operand_control; //sw1~sw2

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
        repeat(2) #150 begin //加法还是减法
            repeat(2) #150 begin //控制三种显示内容
                repeat(5) #150 begin //a, b值的变化
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