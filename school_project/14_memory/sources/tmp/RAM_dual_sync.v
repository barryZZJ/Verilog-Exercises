// 同步读双端口2x8个8位存储器
// 双倍的存取，双倍的快乐

module RAM_dual_sync #(parameter WIDTH = 8)            //读写数据的位数
                      (input [WIDTH-1:0] din_a,        //输入数据a
                       input [WIDTH-1:0] din_b,       //输入数据b
                       input [2:0] addr_a,             //采集地址a，控制读和写前8个中的哪一个寄存器
                       input [2:0] addr_b,             //采集地址b，控制读和写后8个中的哪一个寄存器
                       input clk,                      //时钟
                       input we,                       //写使能
                       output reg [WIDTH-1:0] dout_a,  //输出数据a
                       output reg [WIDTH-1:0] dout_b); //输出数据b
    
reg [WIDTH-1:0] mema[0:7]; //存储数据a用的数组，0~7对应第几个寄存器
reg [WIDTH-1:0] memb[0:7]; //存储数据b用的数组，0~7对应第几个寄存器

always @(posedge clk) begin
    
    dout_a <= {(WIDTH-1){1'bx}};
    dout_b <= {(WIDTH-1){1'bx}};
    
    if (we) begin
        //写数据
        mema[addr_a] <= din_a;
        memb[addr_b] <= din_b;
    end else begin
        //读数据
        dout_a <= mema[addr_a];
        dout_b <= memb[addr_b];
    end
end
    
endmodule
