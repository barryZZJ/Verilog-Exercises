//将SW15~SW12作为第一操作数（显示在左起第一个7段数码管上），
//SW11~SW8作为第二操作数（显示在左起第二个7段数码管上），
//注意，a,b代表两个操作数低四位，因此第四位不算符号位
//SW0=0（1）时做加（减）法，
//将结果显示在左起第四个7段数码管上，
//结果为负数时小数点亮
//进位(LED0)和溢出(LED1)标志通过LED灯显示

module top_v2 #(parameter INTERVAL = 10**5/2)
               (input CLK,
                input[3:0] a,                 //sw15~sw12
                input[3:0] b,                 //sw11~sw8
                input add_sub_signal,         //sw0
                //output reg[15:0] res, //debug
                output[11:0] DISP,
                output reg LED_c,                 //进位
                output reg LED_o);                //溢出

    wire[31:0] s_add;
    wire[31:0] s_sub;
    wire cout_add;
    wire cout_sub;
    wire overflow_add;
    wire overflow_sub;
    reg [15:0] res;
    reg[3:0] neg; //各位是否为负数
    
    full_adder_32_v2 u_fadder_32_v2(1'b0, {28'b0,a}, {28'b0,b}, s_add, cout_add, overflow_add);
    full_subtractor_32_v2 u_fsub_32_v2({28'b0,a}, {28'b0,b}, s_sub, cout_sub, overflow_sub);

    display_16bto4h #(INTERVAL) u_disp(CLK, res, neg, DISP);

    //暂时不会动态修改task的参数，只能用笨办法写两个task了
    task abs_3; //res赋值为s的绝对值，neg对应s的正负
        parameter RMSB = 3; //res的最高位，两个操作数为3，结果为7
        input[31:0] s;
        output[RMSB:0] res;
        output neg;
        reg[31:0] s_neg;
    begin
        neg = 1'b0;
        if(s[31] == 0) //正数
            res = s[RMSB:0];
        else begin //负数
            s_neg = -s;
            res = s_neg[RMSB:0];
            neg = 1'b1;
        end
    end
    endtask

    task abs_7; //res赋值为s的绝对值，neg对应s的正负
        parameter RMSB = 7; //res的最高位，两个操作数为3，结果为7
        input[31:0] s;
        output[RMSB:0] res;
        output neg;
        reg[31:0] s_neg;
    begin
        neg = 1'b0;
        if(s[31] == 0) //正数
            res = s[RMSB:0];
        else begin //负数
            s_neg = -s;
            res = s_neg[RMSB:0];
            neg = 1'b1;
        end
    end
    endtask

    always @(a, b, add_sub_signal, s_add, s_sub, cout_add, cout_sub, overflow_add, overflow_sub) begin
        neg = 4'b0;
        res = 16'bx;

        LED_c = 0;
        LED_o = 0;

        //显示结果
        if (add_sub_signal == 0) begin
            abs_7 (s_add, res[7:0], neg[0]); //结果的小数点只显示最后一个
            LED_c = cout_add;
            LED_o = overflow_add;
        end else begin
            abs_7 (s_sub, res[7:0], neg[0]); //结果的小数点只显示最后一个
            LED_c = cout_sub;
            LED_o = overflow_sub;
        end

        //显示第一个操作数
        abs_3 ({28'b0,a}, res[15:12], neg[3]);

        //显示第二个操作数
        abs_3 ({28'b0,b}, res[11:8], neg[2]);

        
    end

endmodule