//5)系统自带的ip实现32位加减法器

//系统自带的加法器实现
module system_adder_32(input CLK,
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

