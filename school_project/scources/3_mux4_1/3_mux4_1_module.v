//模块实现
module mux4_1_module(input [2:0] a,
                     input [2:0] b,
                     input [2:0] c,
                     input [2:0] d,
                     input [1:0] s,
                     output reg [2:0] y);
    always @(*) begin
        case (s)
            0: y = a;
            1: y = b;
            2: y = c;
            3: y = d;
            default: y = 4'bx;
        endcase
    end
endmodule