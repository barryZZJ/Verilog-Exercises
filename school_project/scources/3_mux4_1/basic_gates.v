//基础的与，或，非，与非门
module gate_and #(parameter WIDTH = 32)
                 (input[WIDTH-1:0] a,
                  input[WIDTH-1:0] b,
                  output[WIDTH-1:0] c);
    assign c = a & b;
    
endmodule
    
module gate_or #(parameter WIDTH = 32)
                (input[WIDTH-1:0] a,
                 input[WIDTH-1:0] b,
                 output[WIDTH-1:0] c);
    assign c = a | b;
endmodule

module gate_not #(parameter WIDTH = 32)
                 (input[WIDTH-1:0] a,
                  output[WIDTH-1:0] c);
    assign c = ~a;
endmodule

module gate_nand #(parameter WIDTH = 32)
                  (input[WIDTH-1:0] a,
                   input[WIDTH-1:0] b,
                   output[WIDTH-1:0] c);
    assign c = ~(a & b);
endmodule
TabNine::config