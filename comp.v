//两个按键，对应三个LED，依次为<. =, >
//重置按钮RST按下时值为1

module comp(
    input CLK, RST,
    input A,B,
    output reg GT, LT, EQ
);
    always @(posedge CLK, negedge RST) begin
        if (RST) begin
            {GT, LT, EQ} <= 3'b0;
            end
        else begin
            if (A>B) 
                {GT, LT, EQ} <= 3'b100;
            else if (A==B)
                {GT, LT, EQ} <= 3'b001;
            else
                {GT, LT, EQ} <= 3'b010;
            end
        end
    end
endmodule // 