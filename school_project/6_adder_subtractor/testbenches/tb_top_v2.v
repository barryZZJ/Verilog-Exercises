//4)
//在3）中的加减法器中增加进位标志和溢出标志，设计实现一个带进位标志和溢出标志的32位加减法器，
//将SW15~SW12作为第一操作数（显示在左起第一个7段数码管上），
//SW11~SW8作为第二操作数（显示在左起第二个7段数码管上），
//注意，a,b代表两个操作数低四位，因此第四位不算符号位
//SW0=0（1）时做加（减）法，SW0对应add_sub_signal
//将结果显示在左起第四个7段数码管上，
//结果为负数时小数点亮
//进位(LED0)和溢出(LED1)标志通过LED灯显示

`timescale 1ps / 1ps

module tb_top_v2;

    reg clk;

    //Inputs
    reg[3:0] a;
    reg[3:0] b;
    reg add_sub_signal;

    //Outputs
    wire[11:0] DISP;
    wire led_c;
    wire led_o;

    initial begin
        clk = 0;
        a = 0;
        b = 0;
        add_sub_signal = 0;
    end
    
    top_v2 #(1) utt
    (
        .CLK (clk),
        .a(a),
        .b(b),
        .add_sub_signal(add_sub_signal),
        .DISP(DISP),
        .LED_c(led_c),
        .LED_o(led_o)
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        //test code here
        repeat(2) #150 begin //加法还是减法
            repeat(5) #150 begin //a, b值的变化
                a = a + 5;
                b = b + 1;
            end
            add_sub_signal = 1;
        end

        $finish;
    end

endmodule