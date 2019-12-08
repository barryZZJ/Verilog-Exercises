//检测是否存在1011
module main #(parameter T50MS = 50*10**5)
             (input [7:0] din, //开关并行输入8位，开关7~0，SW7为低位
              input read,      //开始读取，开关15
              input rst,       //复位，开关14
              input clk,       //自带时钟
              input btnclk,    //按键模拟clk，按键中键
              output ldrst,    //复位提示灯，LED14
              output ldclk,    //clk脉冲提示灯，LED15
              output ldres);   //含1011序列提示灯，LED3
//------------------------------
//按键模拟时钟信号消抖
wire btnclk_d;
debkey #(T50MS) udeb(clk, btnclk, btnclk_d);
//------------------------------
//模拟按键提示灯
assign ldclk = btnclk_d;
//复位提示灯
assign ldrst = rst;
//------------------------------
//并行输入，每个模拟时钟上升沿输出一位
wire X;
par2ser up2s (din, read, rst, btnclk_d, X);
//------------------------------
//实例化米里状态机，每个模拟时钟上升沿输入X，输出Y
wire Y;
assign ldres = Y;
mealy umly (btnclk_d, rst, X, Y);

endmodule 
