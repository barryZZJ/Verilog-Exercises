//流水灯
module led(CLK,
           LED,
           SW);
    input CLK,SW;
    output[3:0] LED;
    reg CLK1s;
    parameter max  = 5000000;
    reg[1:0] state = 2'b00;
    reg[30:0] n;
    reg[3:0] LED;
    always @(posedge CLK)begin
        if (n == max)begin
            if (!CLK1s)CLK1s <= 1'b1;
            else CLK1s       <= 1'b0;
            n                <= 0;
        end
        else n <= n+1;
    end
    always @(posedge CLK1s)begin
        case(state)
            2'b00:begin
                state <= 2'b01;
                if (SW)begin
                    LED <= 4'b1000;
                end
                else begin
                    LED <= 4'b0111;
                end
            end
            2'b01:begin
                state <= 2'b10;
                if (SW)begin
                    LED <= 4'b0100;
                end
                else begin
                    LED <= 4'b1011;
                end
            end
            2'b10:begin
                state <= 2'b11;
                if (SW)begin
                    LED <= 4'b0010;
                end
                else begin
                    LED <= 4'b1101;
                end
            end
            2'b11:begin
                state <= 2'b00;
                if (SW)begin
                    LED <= 4'b0001;
                end
                else begin
                    LED <= 4'b1110;
                end
            end
        endcase
    end
endmodule
