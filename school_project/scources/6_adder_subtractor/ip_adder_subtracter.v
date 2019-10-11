//特点，同步，结果比操作数晚两个tick
//系统自带的加减法器实现
module ip_adder(input CLK,
                input cin,
                input[31:0] x,
                input[31:0] y,
                output[31:0] s);

    c_addsub_0 u_add(
        .A(x),
        .B(y),
        .C_IN(cin),
        .CLK(CLK),
        .S(s)
    );

endmodule

//系统自带的加减法器实现
module ip_subtracter(input CLK,
                     input[31:0] x,
                     input[31:0] y,
                     output[31:0] s);

    c_addsub_1 u_add(
        .A(x),
        .B(y),
        .CLK(CLK),
        .S(s)
    );

endmodule