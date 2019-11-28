//带使能输入的n位右移器
module shiftrne #(parameter WIDTH = 16)
                 (input [WIDTH-1:0] data,
                  input load,             //load为1时读取内容，为0时进行移�?
                  input enable,
                  input clk,
                  input w,                //移位时高位补什么
                  output reg [WIDTH-1:0] o); //输出

integer i;                  
always @(posedge clk) begin
    if (load)
        o <= data;
    else if(enable) begin
        o <= o >> 1'b1;
        o[WIDTH-1] <= w;
    end
end
endmodule
