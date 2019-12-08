//检测是否存在1011
module mealy(input clk,
             input rst,
             input X,       //输入
             output reg Y); //输出
// 状态编码
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b11, S3 = 2'b10;
//状态转换
reg [1:0] curr_state = S0;

always @(posedge clk) begin
    Y <= 1'b0;
    if (rst)
        curr_state <= S0;
    else
        case (curr_state)
            S0: if (X==0)
                    curr_state <= S0;
                else
                    curr_state <= S1; 
            S1: if (X==0)
                    curr_state <= S2;
                else
                    curr_state <= S1;
            S2: if (X==0)
                    curr_state <= S0;
                else
                    curr_state <= S3;
            S3: if (X==0)
                    curr_state <= S0;
                else begin
                    curr_state <= S1;
                    Y <= 1'b1;
                end
            default: curr_state <= S0;
        endcase
end
    
endmodule //
