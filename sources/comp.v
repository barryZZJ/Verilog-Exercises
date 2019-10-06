//比较器，比较a和b的大小关系
//两个按键对应a,b的值，对应三个LED，依次为<, =, >时亮起
//重置按钮RST按下时值为1，不进行比较

module comp(
    input CLK, RST,
    input A,B,
    output reg GT, LT, EQ
);
    always @(posedge CLK, negedge RST) begin
        if (RST) 
            {GT, LT, EQ} <= 3'b0;
            
        else
            if (A>B) 
                {GT, LT, EQ} <= 3'b100;
            else if (A==B)
                {GT, LT, EQ} <= 3'b001;
            else
                {GT, LT, EQ} <= 3'b010;
        
    end
endmodule // 