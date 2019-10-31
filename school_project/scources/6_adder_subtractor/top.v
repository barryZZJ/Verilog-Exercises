//3)
//编写顶层模块将加减法器模块和7段数码管显示模块连接起来，
//将SW15~SW12作为第一操作数低4位，SW11~SW8作为第二操作数低4位，
//注意，a,b代表两个操作数低四位，因此第四位不算符号位
//SW0=0（1）时做加（减）法，SW0对应add_sub_signal
//结果为负数时小数点亮
//添加选择控制SW1~SW2，能选择将操作数1或操作数2或结果显示在7段数码管上。 //sw1~sw2对应operand_control
module top #(parameter INTERVAL = 10**5/2)
            (input CLK,
             input[3:0] a,                 //sw15~sw12
             input[3:0] b,                 //sw11~sw8
             input add_sub_signal,         //sw0
             input[1:0] operand_control,   //sw1~sw2
             output[11:0] DISP);

    wire[31:0] s_add;
    wire[31:0] s_sub;
    reg[15:0] res;
    reg[3:0] neg;
    
    full_adder_32 u_fadder_32(1'b0, {28'b0,a}, {28'b0,b}, s_add);
    full_subtractor_32 u_fsub_32({28'b0,a}, {28'b0,b}, s_sub);

    display_16bto4h #(INTERVAL) u_disp(CLK, res, neg, DISP);

    task abs; //res赋值为s的绝对值，neg对应s的正负
        input[31:0] s;
        output[15:0] res;
        output neg;
        reg[31:0] s_neg;
    begin
        neg = 1'b0;
        if(s[31] == 0) //正数
            res = s[15:0];
        else begin //负数
            s_neg = -s;
            res = s_neg[15:0];
            neg = 1'b1;
        end
    end
    endtask

    always @(a, b, add_sub_signal, operand_control, s_add, s_sub) begin
        neg = 4'b0;
        res = 16'bx;

        case (operand_control)
            0: //显示结果
                if (add_sub_signal == 0)
                    abs(s_add, res, neg[0]);//小数点只亮最后一位
                else
                    abs(s_sub, res, neg[0]);

            1: //显示第一个操作数
                abs({28'b0,a}, res, neg[0]);

            2: //显示第二个操作数
                abs({28'b0,b}, res, neg[0]);

        endcase

    end

endmodule