// 单端口8个8位存储器，可选同步读还是异步读
// 写使能有效时，执行写操作，否则执行读取操作
// 写的时候可以写入不同的地址（写入第addr个寄存器），读的时候也可以选择读不同的地址

// Sync_Async为0或1控制同步读还是异步读
// 同步读：在clk上升沿时读addr
// 异步读：只要we无效，addr有效就开始读

module RAM_sing_top #(parameter WIDTH = 8, //读写数据的位宽
                      parameter Sync_Async = 0) //同步读还是异步读，默认同步读。
                     (input [WIDTH-1:0] data_in,    //输入数据
                      input [2:0] addr, //采集地址，控制读和写8个中的哪一个寄存器
                      input clk,        //时钟
                      input we,         //写使能
                      output [WIDTH-1:0] data_out); //输出数据

if (Sync_Async == 0)
    RAM_sing_sync #(WIDTH) utt()
else
    RAM_sing_async #(WIDTH) utt2()

endmodule
