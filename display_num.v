task display_num;
    input integer pos; //which digit to show
    input [3:0] num; //digit number
    input dp; //show dot
    output reg [11:0] DISP; //displayer
    begin
        case (pos)
            0: DISP[11:8] <= 4'b0111;
            1: DISP[11:8] <= 4'b1011;
            2: DISP[11:8] <= 4'b1101;
            3: DISP[11:8] <= 4'b1110;
            default: DISP[11:8] <= 4'b0111;
        endcase

        case (num)
            0: DISP[7:1] <= 7'b0000001;
            1: DISP[7:1] <= 7'b1001111;
            2: DISP[7:1] <= 7'b0010010;
            3: DISP[7:1] <= 7'b0000110;
            4: DISP[7:1] <= 7'b1001100;
            5: DISP[7:1] <= 7'b0100100;
            6: DISP[7:1] <= 7'b0100000;
            7: DISP[7:1] <= 7'b0001111;
            8: DISP[7:1] <= 7'b0000000;
            9: DISP[7:1] <= 7'b0000100;
            default: DISP[7:1] <= 7'b1111111;
        endcase

        if (dp) 
            DISP[0] <= 1'b0;
        else 
            DISP[0] <= 1'b1;
    end
endtask