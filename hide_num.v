task hide_num;
    input pos; //which digit to hide
    output reg [11:0] DISP;
    begin
        DISP <= 12'b111111111111;
    end
endtask