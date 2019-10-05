`timescale  1ns / 1ps

module test;

    reg CLK=0;

    reg [13:0] SW=0;
    wire [11:0] DISP;

    always #(5)
        CLK = ~CLK;
    
    reg [3:0] posb;
    reg [3:0] num;
    reg dp = 0;

    display_num #(5) u_dnm(.CLK(CLK), .posb(posb), .num(num), .dp(dp), .DISP(DISP));

    integer counter = 0;
    reg [1:0] pos = 0;
    always @(posedge CLK) begin
        counter <= counter + 1;
        if (counter == 5) begin
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
    d <= SW%10;
    c <= (SW/10)%10;
    b <= (SW/100)%10;
    a <= (SW/1000)%10;
*/
    always @(posedge CLK) begin
        case (pos)
            0: num <= SW%10;
            1: num <= SW>=10 ? (SW/10)%10 : 10;
            2: num <= SW>=100 ? (SW/100)%10 : 10;
            3: num <= SW>=1000 ? (SW/1000)%10 : 10;
            default: num <= 10;
        endcase
    end

    initial begin
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        #20
        SW = SW + 1;
        $finish;
    end

        

endmodule
