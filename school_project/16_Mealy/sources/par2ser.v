//8 位并转串输出模块
module par2ser(input [7:0] din,
               input read,    //读控制
               input rst,
               input clk,
               output dout);

reg [7:0] mem = 8'b0;

assign dout = mem[0];

always @(posedge clk) begin
    if (rst)
        mem <= 8'bx;
    else if (read) 
        mem <= din;
    else
        mem <= (mem >> 1'b1);
    
end
endmodule
