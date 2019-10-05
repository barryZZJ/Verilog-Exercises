//开关代表二进制数，只用到13个开关，用数码管显示对应的10进制数

module sw_decoder(
    input CLK,
    input [13:0] SW,
    output[11:0] DISP
);
    parameter T1MS = 10**5;
    parameter interval = T1MS/2;
    reg [3:0] posb;
    reg [3:0] num;
    reg dp = 0;

    display_num #(interval) u_dnm(.CLK(CLK), .posb(posb), .num(num), .dp(dp), .DISP(DISP));

    integer counter = 0;
    reg [1:0] pos = 0;
    always @(posedge CLK) begin
        counter <= counter + 1;
        if (counter == interval) begin
            counter <= 0;
            pos <= pos + 1;
            if(pos == 3)
                pos <= 0;
        end
    end

    always @(posedge CLK) begin
        case (pos)
            3: posb <= 4'b0111;
            2: posb <= 4'b1011;
            1: posb <= 4'b1101;
            0: posb <= 4'b1110;
            default: posb <= 4'b1111;
        endcase
    end
/*
    d <= SW%10;//个位
    c <= (SW/10)%10;//十位
    b <= (SW/100)%10;//百位
    a <= (SW/1000)%10;//千位
*/
    always @(SW) begin
        case (pos)
            0: num <= SW%10;
            1: num <= SW>=10 ? (SW/10)%10 : 10;
            2: num <= SW>=100 ? (SW/100)%10 : 10;
            3: num <= SW>=1000 ? (SW/1000)%10 : 10;
            default: num <= 10;
        endcase
    end

endmodule // 
