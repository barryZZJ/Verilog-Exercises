module divider #(parameter n = 16)
                (input clk,
                 input e, //使能，关闭时divider的输出保持原来的结果
                 input read, //read为1时读，为0时计算。 e开启前read应提前开启
                 input [n-1:0] dataA, //第一个操作数
                 input [n-1:0] dataB, //第二个操作数
                 output reg [n-1:0] q, //商
                 output reg [n-1:0] r, //余数
                 output reg done); //是否完成

//A从高位开始每个时钟上升沿往R里移一位，如T=0,R[0]=A[16], T=1,R[1:0]=A[16:15]
//同时每个时钟上升沿看R是否大于B，
//如果大于等于，则先R=R-B，再往R里移A的高位。同时往q低位移入1
//如果小于，则R不变等着下一次移进更多的数，同时q低位移入0

reg [n-1:0] a;

integer counter; //计数器，移位n次后说明计算结束
always @(posedge clk) begin
    if (read) begin
    //只读时存dataA，其他变量保持默认值
        a <= dataA;
        r <= {n{1'b0}};
        q <= {n{1'b0}};
        done <= 1'b0;
        counter <= 0;
    end else if (e) begin
        if (counter == n) begin
        //计算结束
            done <= 1'b1;
            r <= r;
            q <= q;
        end else begin
            counter <= counter + 1;
            //a左移
            a <= {a[n-2:0], 1'b0};
            //---------------------------------
            //判断 借位后的R 是否需要减去对应的B，q需要补1还是补0
            //同时r左移，低位补a的高位
            if ({r[n-2:0], a[n-1]} >= dataB) begin
                r <= {r[n-2:0], a[n-1]} - dataB;
                q <= {q[n-1:0], 1'b1};
            end else begin
                r <= {r[n-2:0], a[n-1]};
                q <= {q[n-1:0], 1'b0};
            end
            //---------------------------------
        end
    end
end

endmodule
