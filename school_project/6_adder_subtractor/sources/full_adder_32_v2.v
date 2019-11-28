//实验六 加减法器
//带进位和溢出的32位全加器
module full_adder_32_v2(input cin,
                        input[31:0] x,
                        input[31:0] y,
                        output[31:0] s,
                        output cout, //进位
                        output o); //溢出
    wire [32:0] c;
    assign c[0] = cin;
    assign cout = c[32]; 
    assign o = 1'b0; //溢出只在使用有符号数时才有意义
    
    genvar i;
    generate
        for(i=0; i<=31; i=i+1) begin:stage
            full_adder u_fadder(.cin(c[i]), .x(x[i]), .y(y[i]), .s(s[i]), .cout(c[i+1]));
        end
    endgenerate

endmodule