//把2位二进制码解码成4位独热码(低电平有效)
module decoder2to4(input[1:0] x,
                   output reg[3:0] y);
    always @(x) begin
        case (x)
            0: y = 4'b1110;
            1: y = 4'b1101;
            2: y = 4'b1011;
            3: y = 4'b0111;
            default: y = 4'b0;
        endcase
    end

endmodule