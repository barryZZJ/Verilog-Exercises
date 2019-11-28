//3)
//编写顶层模块将加减法器模块和7段数码管显示模块连接起来，
//将SW15~SW12作为第一操作数低4位，SW11~SW8作为第二操作数低4位，
//注意，a,b代表两个操作数低四位，因此第四位不算符号位
//SW0=0（1）时做加（减）法，SW0对应add_sub_signal
//结果为负数时小数点亮
//添加选择控制SW1~SW2，能选择将操作数1或操作数2或结果显示在7段数码管上。 
//sw1~sw2对应operand_control，0显示结果，1显示第一位操作数，2显示第二位操作数
module top #(parameter INTERVAL = 10**5/2)
            (input CLK,
             input[3:0] a,                 //sw15~sw12
             input[3:0] b,                 //sw11~sw8
             input add_sub_signal,         //sw0
             input[1:0] operand_control,   //sw1~sw2
             output[11:0] DISP);

    wire[31:0] s_add; //存a+b
    wire[31:0] s_sub; //存a-b
    wire[31:0] s_neg; //存-s_sub，因为不能直接对-s_sub取[15:0]
    reg[15:0] res; //要显示的内容
    reg neg; //结果有没有负号
    
    full_adder_32 u_fadder_32(1'b0, {28'b0,a}, {28'b0,b}, s_add);// 不带进位和溢出标志的加法器
    full_subtractor_32 u_fsub_32({28'b0,a}, {28'b0,b}, s_sub); // 不带进位和溢出标志的减法器
    assign s_neg = -s_sub;

    display_16bto4h #(INTERVAL) u_disp(CLK, res, neg, DISP);

    always @(a, b, add_sub_signal, operand_control, s_add, s_sub) begin
        neg = 1'b0;//默认是正数
        res = 16'bx;

        case (operand_control)
        //数码管永远显示整数，符号显示在小数点上
            0: //显示结果
                if (add_sub_signal == 0)
                    res = s_add; //正数相加一定是正数
                else
                    if (s_sub[31] == 0) begin
                        //正数
                        res = s_sub[15:0];
                    end else begin
                        //负数
                        res = s_neg[15:0];
                        neg = 1'b1;
                    end

            1: //显示第一个操作数
                res = {12'b0, a};

            2: //显示第二个操作数
                res = {12'b0, b};

        endcase

    end

endmodule