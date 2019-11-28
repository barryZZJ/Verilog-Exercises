// 单端口8个8位存储器，可选同步读还是异步读
// 写使能有效时，执行写操作，否则执行读取操作
// 写的时候可以写入不同的地址（写入第addr个寄存器），读的时候也可以选择读不同的地址

// Sync_Async为0或1控制同步读还是异步读
// 同步读：在clk上升沿时读addr
// 异步读：只要we无效，addr有效就开始读

module RAM_sing #(parameter WIDTH = 8, //读写数据的位宽
                  parameter Sync_Async = 0) //同步读还是异步读，默认同步读。
                 (input [WIDTH-1:0] data_in,    //输入数据
                  input [2:0] addr, //采集地址，控制读和写8个中的哪一个寄存器
                  input clk,        //时钟
                  input we,         //写使能
                  output reg [WIDTH-1:0] data_out); //输出数据

reg [WIDTH-1:0] mem[0:7]; //存储数据用的数组，0~7对应第几个寄存器

//------------------------------
//写数据
always @(posedge clk) begin
    if (we)
        mem[addr] <= data_in;
end

//------------------------------
//读数据
//Sync_Async必须是常量，不能作为输入端口，否则会报错
if (Sync_Async == 0) begin
//同步读
//在clk上升沿时读addr
    always @(posedge clk) begin
        data_out <= {(WIDTH-1){1'bx}};
        if (!we)
            data_out <= mem[addr];
    end
end else begin
//异步读
//只要we无效，addr有效就开始读
    always @(*) begin
        data_out <= {(WIDTH-1){1'bx}};
        if (!we)
            data_out <= mem[addr];
    end
end

endmodule 
