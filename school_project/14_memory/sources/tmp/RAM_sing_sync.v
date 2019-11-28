// 同步读单端口8个8位存储器
// 写使能有效时，执行写操作，否则执行读取操作
// 写的时候可以写入不同的地址（写入第addr个寄存器），读的时候也可以选择读不同的地址

// 同步读：在clk上升沿时读addr
module RAM_sing_sync #(parameter WIDTH = 8) //读写数据的位宽
                      (input [WIDTH-1:0] data_in,    //输入数据
                       input [2:0] addr, //采集地址，控制读和写8个中的哪一个寄存器
                       input clk,        //时钟
                       input we,         //写使能
                       output reg [WIDTH-1:0] data_out); //输出数据

reg [WIDTH-1:0] mem[0:7]; //存储数据用的数组，0~7对应第几个寄存器

always @(posedge clk) begin
    
    data_out <= {(WIDTH-1){1'bx}};
    
    if (we) begin
        //写数据
        mem[addr] <= data_in;
    end else begin
        //读数据
        data_out <= mem[addr];
    end
end

endmodule 
