//5)系统自带的ip实现32位加减法器
//系统自带的减法器实现
module system_subtracter_32(input CLK,
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