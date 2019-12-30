module mealy(input [7:0] din, //4个2位二进制密码
             input clk,     //模拟时钟+输入按键
             input rst,     //重置信号，只有重置时才能设置密码
             input [1:0]X,       //当前输入
            //  output reg [6:0] ld_curr,
             output [7:0] p, //已设置的密码
             output pass,   //正确信号
             output fail);  //错误信号

parameter S0 = 3'b000, S1 = 3'b010, S2 = 3'b110, S3 = 3'b100,
          S4 = 3'b011, S5 = 3'b111, S6 = 3'b101;

reg [2:0] curr_state;
reg [7:0] p;
reg pass;
reg fail;

// always @(curr_state) begin
//     if (curr_state == S0)
//         ld_curr = 7'b1000000;
//     else if (curr_state == S1)
//         ld_curr = 7'b0100000;
//     else if (curr_state == S2)
//         ld_curr = 7'b0010000;
//     else if (curr_state == S3)
//         ld_curr = 7'b0001000;
//     else if (curr_state == S4)
//         ld_curr = 7'b0000100;
//     else if (curr_state == S5)
//         ld_curr = 7'b0000010;
//     else if (curr_state == S6)
//         ld_curr = 7'b0000001;
//     else
//         ld_curr = 7'b0;
// end

//按键上升沿赋值，下降沿在状态机里检测
always @(negedge clk) begin
    if (rst) begin //重置
        fail <= 1'b0;
        pass <= 1'b0;
        curr_state <= S0;
        p <= din;
    end else begin
        if (!pass && !fail) //如果某一个为1说明已经输入了4位，不再接受输入
            case (curr_state)
                S0: if (X == p[7:6]) begin
                        curr_state <= S1;
                        pass <= 1'b0;
                        fail <= 1'b0;
                    end else begin
                        curr_state <= S4;
                        pass <= 1'b0;
                        fail <= 1'b0;
                    end
                S1: if (X == p[5:4]) begin
                        curr_state <= S2;
                        pass <= 1'b0;
                        fail <= 1'b0;
                    end else begin
                        curr_state <= S5;
                        pass <= 1'b0;
                        fail <= 1'b0;
                    end
                S2: if (X == p[3:2]) begin
                        curr_state <= S3;
                        pass <= 1'b0;
                        fail <= 1'b0;
                    end else begin
                        curr_state <= S6;
                        pass <= 1'b0;
                        fail <= 1'b0;
                    end
                S3: if (X == p[1:0]) begin
                        curr_state <= S3;
                        pass <= 1'b1;
                        fail <= 1'b0;
                    end else begin
                        curr_state <= S6;
                        pass <= 1'b0;
                        fail <= 1'b1;
                    end
                S4: begin
                        curr_state <= S5;
                        pass <= 1'b0;
                        fail <= 1'b0;
                    end
                S5: begin
                        curr_state <= S6;
                        pass <= 1'b0;
                        fail <= 1'b0;
                    end
                S6: begin
                        curr_state <= S6;
                        pass <= 1'b0;
                        fail <= 1'b1;
                    end
                default: begin
                        //不应该出现的情况
                            curr_state <= S0;
                            pass <= 1'b1;
                            fail <= 1'b1;
                        end
            endcase
    end
end

endmodule 
