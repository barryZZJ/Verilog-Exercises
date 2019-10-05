module main(
    input CLK,
    output reg[11:0] DISP
);

    parameter T1MS = 10**5;
    integer count=0;
    integer pos=0;
    integer num=0;

    always @(posedge CLK) begin
        display_num(num, 1, DISP);
    end

    // always @(pos,num) begin
    //     display_num(pos, num, 0, DISP);
    // end

    // always @(posedge CLK) begin
        
    //     count <= count + 1;
    //     if (count == T1MS*200) begin //200ms
    //         count <= 0;
    //         num <= num + 1;
    //         if(num == 9)
    //             num <= 0;

    //         pos <= pos + 1;
    //         if(pos == 3)
    //             pos <= 0;
    //     end
    // end
    
    always @(posedge CLK) begin
        count <= count + 1;
        if (count == T1MS*50) begin //200ms
            count <= 0;
            num <= num + 1;
            if(num == 9)
                num <= 0;
        end
    end

    task display_num;
        //input integer pos; //which digit to show
        input [3:0] num; //digit number
        input dp; //show dot
        output reg [11:0] DISP; //displayer
        begin
            
            DISP[11:8] <= 4'b0000;
                
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
endmodule