module test(input clk, output reg dout, output sel);

reg sel = 1;

always @(*) begin
    sel <= sel;
    dout <= sel;
end
        
endmodule