module main #(parameter T50MS = 50*10**5)
             (input [7:0] din, //每个开关对应一个2位二进制密码，共四个开关7~6、5~4、3~2、1~0
              input clk,     //时钟
              input rst,     //重置信号，开关14
              input btnclk,  //按键模拟时钟，按键中
              input btn0,    //输入0，按键左
              input btn1,    //输入1，按键右
              input btn2,    //输入2，按键上
              input btn3,    //输入3，按键下
              output [7:0] lddin, //当前密码提示灯
              output ldbtn,    //按键提示灯，LED15
              output ldpass,   //通过灯，ld14
              output ldfail);  //失败灯，ld13

//------------------------------
//按键消抖
wire btnclk_d;
wire btn0_d, btn1_d, btn2_d, btn3_d;
if (T50MS != 0) begin
//板子上的按键进行消抖
    debkey #(T50MS) uk_c (clk, btnclk, btnclk_d);
    debkey #(T50MS) uk_l (clk, btn0, btn0_d);
    debkey #(T50MS) uk_r (clk, btn1, btn1_d);
    debkey #(T50MS) uk_u (clk, btn2, btn2_d);
    debkey #(T50MS) uk_d (clk, btn3, btn3_d);
end else begin 
//如果是仿真文件就不进行消抖
    assign btnclk_d = btnclk;
    assign btn0_d = btn0;
    assign btn1_d = btn1;
    assign btn2_d = btn2;
    assign btn3_d = btn3;
end
//------------------------------
//按下任一按键模拟时钟均上升
wire simclk = btnclk_d | btn0_d | btn1_d | btn2_d | btn3_d; 
//按键提示灯
assign ldbtn = simclk;
//------------------------------

reg [1:0]X; //当前输入数字
always @(posedge btn0_d or posedge btn1_d or posedge btn2_d or posedge btn3_d) begin
//按键上升沿赋值，下降沿在状态机里检测
    if (btn0_d)
        X <= 2'b00;
    else if (btn1_d)
        X <= 2'b01;
    else if (btn2_d)
        X <= 2'b10;
    else if (btn3_d)
        X <= 2'b11;
end
//------------------------------
//实例化状态机
wire pass; //密码正确信号
wire fail; //密码错误信号
assign ldpass = pass;
assign ldfail = fail;

mealy umly (din, simclk, rst, X, lddin, pass, fail);

endmodule