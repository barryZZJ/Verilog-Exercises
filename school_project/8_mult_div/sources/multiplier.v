
module multiplier #(parameter n = 16)
                   (input clk,  //时钟
                    input e, //使能，关闭时输出保持原来的结果
                    input read, //read为1时读，为0时计算 e开启前read应提前开启
                    input [n-1:0] dataA, //第一个操作数
                    input [n-1:0] dataB, //第二个操作数
                    output reg [2*n-1:0] s, //结果
                    output reg done); //是否完成

//每个时钟上升沿，b向右移一位，高位补0，a向左移一位，低位补0
//s每次加上移位后的a
//当b变为0时移位结束

reg [2*n-1:0] a; //移位后的a
reg [n-1:0] b; //移位后的b

wire [2*n-1:0] sum;

assign sum = s + a;

always @(posedge clk) begin
    
    if (read) begin
    //只读，保持默认值
        a <= {{n{1'b0}}, dataA};
        b <= dataB;
        s <= s;
        done <= 1'b0;
    end else if(e) begin
    //计算
        if (b == {n{1'b0}}) begin
        //计算结束
            done <= 1'b1;
        end else begin //b低位是1，加上该位
            done <= 1'b0;
            s <= b[0] ? sum : s;
            //对a左移
            a <= {a[2*n-2:0], 1'b0};
            //对b右移
            b <= {1'b0, b[n-1:1]};
        end
    end
end

endmodule
