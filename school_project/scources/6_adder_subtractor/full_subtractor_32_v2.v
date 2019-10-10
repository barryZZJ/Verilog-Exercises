//实验六 加减法器
//带进位和溢出的32位全减器
module full_subtractor_32_v2(input[31:0] x,
                             input[31:0] y,
                             output[31:0] s,
                             output cout, //进位
                             output o); //溢出
    wire [32:0] c;
    assign c[0] = 1;
    assign cout = c[32];
    assign o = x[31] & y[31] & ~s[31] + ~x[31] & ~y[31] & s[31];

    function ones_complement; //反码
        input [31:0] x;
        ones_complement = x ^ 32'hffffffff;
    endfunction

    genvar i;
    generate
        for (i = 0; i<=31; i=i+1) begin: stage
            full_adder u_subtractor(.cin(c[i]),
                                    .x(x[i]),
                                    .y(ones_complement(y[i])),
                                    .s(s[i]),
                                    .cout(c[i+1])
                                    );
        end
    endgenerate

endmodule
