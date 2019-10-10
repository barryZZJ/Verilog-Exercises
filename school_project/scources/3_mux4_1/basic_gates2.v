//3个输入的与，4个输入的或门
module gate_and3 #(parameter WIDTH = 32)
                 (input s0,
                  input[WIDTH-1:0] b,
                  input s1,
                  output[WIDTH-1:0] d);
    assign d = s0 && s1 ? b : 0;
    
endmodule
    
module gate_or4 #(parameter WIDTH = 32)
                (input[WIDTH-1:0] a,
                 input[WIDTH-1:0] b,
                 input[WIDTH-1:0] c,
                 input[WIDTH-1:0] d,
                 output[WIDTH-1:0] e);
    assign e = a | b | c | d;
endmodule
