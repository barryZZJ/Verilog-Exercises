//实验六 加减法器
//32位全加器
module full_adder_32(input cin,
                     input[31:0] x,
                     input[31:0] y,
                     output[31:0] s,
                     output cout);
    genvar i;
    generate
        for(i=0; i<32; i=i+1) begin:stage
            full_adder u_fadder(.cin(cin), .x(x[i]), .y(y[i]), .s(s[i]), .cout(cout));
        end
    endgenerate

endmodule