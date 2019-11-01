//实验六 加减法器
//带进位和溢出的32位全减器
module full_subtractor_32_v2(input[31:0] x,
                             input[31:0] y,
                             output[31:0] s,
                             output cout, //进位
                             output o); //溢出
    wire [32:0] c;
    assign c[0] = 1;
    assign cout = 1'b0; //进位只在涉及无符号数时有意义
    assign o = x[31] & y[31] & ~s[31] + ~x[31] & ~y[31] & s[31]; //只有两操作数符号位相同，且与结果符号位不同时才溢出

    genvar i;
    generate
        for (i = 0; i<=31; i=i+1) begin: stage
            full_adder u_subtractor(.cin(c[i]),
                                    .x(x[i]),
                                    .y(~y[i]),
                                    .s(s[i]),
                                    .cout(c[i+1])
                                    );
        end
    endgenerate

endmodule
