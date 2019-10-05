module encoder4_2(
    input[3:0] SW,
    output reg[1:0] LED
);
    always @(SW) begin
        case (SW)
            4'b0111: LED<=2'b11;
            4'b1011: LED<=2'b10;
            4'b1101: LED<=2'b01;
            4'b1110: LED<=2'b00;
            default: LED<=2'bzz;
        endcase
    end
    
endmodule // encoder4_2