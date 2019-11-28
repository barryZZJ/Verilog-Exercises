//模块实现
module mux4to1_module(input [2:0] w0,
                      input [2:0] w1,
                      input [2:0] w2,
                      input [2:0] w3,
                      input [1:0] s,
                      output reg [2:0] f);
    always @(*) begin
        case (s)
            0: f = w0;
            1: f = w1;
            2: f = w2;
            3: f = w3;
            default: f = 3'bx;
        endcase
    end
endmodule