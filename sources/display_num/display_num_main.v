module main_disp_num(
    input CLK,
    output[11:0] DISP
);
    parameter T1MS = 10**5;
    parameter interval = T1MS*500;
    integer counter = 0;
    reg[3:0] num=4'b0;
    reg[3:0] posb=4'b0011;
    reg dp = 1;

    display_num #(interval) u_dnm(CLK, posb, num, dp, DISP);

    always @(posedge CLK) begin
        counter <= counter + 1;
        if(counter == interval) begin
            counter <= 0;
            num <= num + 1;
            if(num == 9)
                num <= 0;
        end
    end

endmodule 