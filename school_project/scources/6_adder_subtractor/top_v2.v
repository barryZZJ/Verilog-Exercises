//4)
//在3）中的加减法器中增加进位标志和溢出标志，设计实现一个带进位标志和溢出标志的32位加减法器，
//将SW15~SW12作为第一操作数（显示在左起第一个7段数码管上），
//SW11~SW8作为第二操作数（显示在左起第二个7段数码管上），
//注意，a,b代表两个操作数低四位，因此第四位不算符号位
//SW0=0（1）时做加（减）法，SW0对应add_sub_signal
//将结果显示在左起第四个7段数码管上，
//结果为负数时小数点亮
//进位(LED0)和溢出(LED1)标志通过LED灯显示

module top_v2 #(parameter INTERVAL = 10**5/2)
               (input CLK,
                input[3:0] a,                 //sw15~sw12
                input[3:0] b,                 //sw11~sw8
                input add_sub_signal,         //sw0
                output[11:0] DISP,
                output reg LED_c,                 //进位
                output reg LED_o);                //溢出

    wire[31:0] s_add; //存a+b
    wire[31:0] s_sub; //存a-b
    wire[31:0] s_neg; //存-s_sub，因为不能直接对-s_sub取[15:0]
    wire cout_add;
    wire cout_sub;
    wire overflow_add;
    wire overflow_sub;
    reg [15:0] res; //15~12, 11~8位为操作数, 7~0位为结果
    reg neg; //结果有没有负号
    
    full_adder_32_v2 u_fadder_32_v2(1'b0, {28'b0,a}, {28'b0,b}, s_add, cout_add, overflow_add);
    full_subtractor_32_v2 u_fsub_32_v2({28'b0,a}, {28'b0,b}, s_sub, cout_sub, overflow_sub);
    assign s_neg = -s_sub;

    display_16bto4h #(INTERVAL) u_disp(CLK, res, neg, DISP);

    always @(a, b, add_sub_signal, s_add, s_sub, cout_add, cout_sub, overflow_add, overflow_sub) begin
        neg = 1'b0;//默认是正数
        res = 16'bx;

        LED_c = 1'b0;
        LED_o = 1'b0;

        //显示第一个操作数
        res[15:12] = a;

        //显示第二个操作数
        res[11:8] = b;

        //显示结果
        //数码管永远显示整数，符号显示在小数点上
        if (add_sub_signal == 0) begin
            // a+b
            res[7:0] = s_add; //正数求和结果一定是正数
            LED_c = cout_add;
            LED_o = overflow_add;
        end else begin
            // a-b
            if (s_sub[31] == 0) begin
                //正数
                res[7:0] = s_sub[15:0];
            end else begin
                //负数
                res[7:0] = s_neg[15:0];
                neg = 1'b1;
            end
            LED_c = cout_sub;
            LED_o = overflow_sub;
        end
        
    end

endmodule