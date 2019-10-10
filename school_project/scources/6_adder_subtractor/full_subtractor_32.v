//实验六 加减法器
//32位全减器
module full_subtractor_32(input [31:0]x,
                          input [31:0]y,
                          output [31:0]s);
    wire [32:0] c;
    assign c[0] = 1;

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
