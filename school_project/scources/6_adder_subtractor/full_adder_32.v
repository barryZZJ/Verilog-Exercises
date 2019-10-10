//实验六 加减法器
//32位全加器
module full_adder_32(input cin,
                     input[31:0] x,
                     input[31:0] y,
                     output[31:0] s);
    wire [32:0] c;
    assign c[0] = cin;
    
    genvar i;
    generate
        for(i=0; i<=31; i=i+1) begin:stage
            full_adder u_fadder(.cin(c[i]), .x(x[i]), .y(y[i]), .s(s[i]), .cout(c[i+1]));
        end
    endgenerate

endmodule