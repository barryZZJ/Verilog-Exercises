//带使能输入的n位左移器
module shiftlne #(parameter WIDTH = 16)
                 (input [WIDTH-1:0] data,
                  input load,             //load为1时读取内容，为0时进行移位
                  input enable,
                  input clk,
                  input w,                //移位时低位补什么
                  output reg [WIDTH-1:0] o); //输出

integer i;                  
always @(posedge clk) begin
    if (load)
        o <= data;
    else if(enable) begin
        o <= o << 1'b1;
        o[0] <= w;
    end
end
endmodule
