function display_num;
    input integer pos; //which digit to show
    input integer num; //digit number
    input reg dp; //show dot
    begin
        case (pos)
            0: tmp[11:8] <= 4'b0111;
            1: tmp[11:8] <= 4'b1011;
            2: tmp[11:8] <= 4'b1101;
            3: tmp[11:8] <= 4'b1110;
            default: tmp[11:8] <= 4'b0111;
        endcase

        case (num)
            0: tmp[7:1] <= 7'b0000001;
            1: tmp[7:1] <= 7'b1001111;
            2: tmp[7:1] <= 7'b0010010;
            3: tmp[7:1] <= 7'b0000110;
            4: tmp[7:1] <= 7'b1001100;
            5: tmp[7:1] <= 7'b0100100;
            6: tmp[7:1] <= 7'b0100000;
            7: tmp[7:1] <= 7'b0001111;
            8: tmp[7:1] <= 7'b0000000;
            9: tmp[7:1] <= 7'b0000100;
            default: tmp[7:1] <= 7'b1111111;
        endcase

        if (dp) 
            tmp[0] <= 1'b0;
        else 
            tmp[0] <= 1'b1;
    end
endfunction