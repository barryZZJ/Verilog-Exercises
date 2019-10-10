//数码管显示模块
//能将16位的二进制数以十六进制形式显示到4个七段数码管上
module display_16bto4h #(parameter INTERVAL = 10*5/2)
                        (input CLK,
                         input [15:0] x,
                         output reg[11:0] DISP);

    integer counter = 0;
    reg CLK_2 = 0;

    reg[1:0] sel = 0; //选择显示哪一位
    wire[3:0] posb; //对应DISP前4位数
    reg[3:0] digit; //对应x的某4位
    integer i;

    always @(posedge CLK) begin
        counter <= counter + 1;
        if (counter == INTERVAL)begin
            CLK_2 = ~CLK_2;
            counter <= 0;
        end
    end

    always @(posedge CLK_2) begin
        sel <= sel + 1;
        if (sel == 3)
            sel <= 0;
    end
    always @(sel) begin
        digit[0] <= x[sel*4];
        digit[1] <= x[sel*4 + 1];
        digit[2] <= x[sel*4 + 2];
        digit[3] <= x[sel*4 + 3];
    end

    decoder2to4 u_dec(sel, posb);//decode sel into posb

    function [6:0] btohDISP;
        input[3:0] digit;//display 4'bin into hex display
        case (digit)
            4'h0:    btohDISP = 7'b0000001;
            4'h1:    btohDISP = 7'b1001111;
            4'h2:    btohDISP = 7'b0010010;
            4'h3:    btohDISP = 7'b0000110;
            4'h4:    btohDISP = 7'b1001100;
            4'h5:    btohDISP = 7'b0100100;
            4'h6:    btohDISP = 7'b0100000;
            4'h7:    btohDISP = 7'b0001111;
            4'h8:    btohDISP = 7'b0000000;
            4'h9:    btohDISP = 7'b0000100;
            4'ha:    btohDISP = 7'b0001000;
            4'hb:    btohDISP = 7'b1100000;
            4'hc:    btohDISP = 7'b0110001;
            4'hd:    btohDISP = 7'b1000010;
            4'he:    btohDISP = 7'b0110000;
            4'hf:    btohDISP = 7'b0111000;
            default: btohDISP = 7'b1111111;
        endcase

    endfunction

    always @(posedge CLK_2) begin
        DISP <= {posb, btohDISP(digit), 1'b1};
    end



endmodule