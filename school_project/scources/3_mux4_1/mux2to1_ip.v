//2选1
//f = w0*~s + w1*s
module mux2to1_ip(input s,
                  input [1:0] w,
                  output f);
    wire s1;
    wire a1;
    wire a2;
    
    gate_not_0 u_n_1(.a(s), .c(s1));
    gate_and_0 u_a_1(.a(s1), .b(w[0]), .c(a1));
    gate_and_0 u_a_2(.a(s), .b(w[1]), .c(a2));
    gate_or_0 u_o_1(.a(a1), .b(a2), .c(f));

endmodule
