//数码管显示模块
//能将32位的二进制数以十六进制形式，间隔一定时间显示高16位还是低16位到4个七段数码管上
//显示低16位时亮右边的小数点，高16位时亮倒数第二个小数点
//BASYS3板子自带的时钟CLK频率是100MHz，即每秒tick 10^8次。所以10^5即为 1ms
module display_32bto4h_e #(parameter FREQ = 10**5/2,  //FREQ控制数码管频率，为1/FREQ Hz
                           parameter INTERVAL = 10**8) //INTERVAL控制高低16位之间变化的间隔，默认为1s
                          (input CLK,//板子自带的clock
                           input e, //使能端
                           input [31:0] x, //要显示的32位数
                           output reg[11:0] DISP); // DISPLAY，数码管

    reg[1:0] sel[0:1] = {2'b0, 2'b0}; //select，选择显示到哪一个数码管，取十进制数0~7,sel[0]对应0~3，sel[1]对应4~7，最后转换成posb八位独热码
    reg[3:0] posb = 4'b116z11; //pos binary，4位独热码，由sel控制，低电平有效，在此代码起作用：“DISP <= {posb, btohDISP(digit), dp};”
    reg[3:0] digit = 4'b0000; //取输入端口x的某4位
    reg dp; //小数点

    //------------------------------
    //高低四位转换
    reg flgupper = 1'b0; //是否显示高四位
    integer counter2 = 0;//计数器，记CLK tick的次数

    always @(posedge CLK) begin
        if (e) begin
            if (counter2 == INTERVAL) begin
                flgupper = ~flgupper;
                counter2 <= 0;
            end else
                counter2 <= counter2 + 1;
        end else
            counter2 <= 0;
    end
    //------------------------------
    //sel切换

    integer counter = 0;//计数器，记CLK tick的次数

    always @(posedge CLK) begin
        if (e) begin
            if (counter == FREQ)begin
                //sel依次取0, 1, 2, 3, 0, 1, 2, 3...每次控制一个数码管
                if (sel[flgupper] == 3) 
                    sel[flgupper] <= 0;
                else
                    sel[flgupper] <= sel[flgupper] + 1;

                counter <= 0; //重置counter
            end else
                counter <= counter + 1;
        end else
            counter <= 0;
    end
    //------------------------------
    //sel转换为独热码posb
    //posb低电平有效, 把0, 1, 2, 3对应转换成1110, 1101, 1011, 0111
    always @(posedge CLK) begin
        case (sel[flgupper])
            0: posb <= 4'b1110;
            1: posb <= 4'b1101;
            2: posb <= 4'b1011;
            3: posb <= 4'b0111;
            default: posb <= 4'b0;
        endcase
    end
    //------------------------------
    //根据sel取对应的x
    always @(posedge CLK) begin
        //digit对应取x的某4位
        digit[0] <= x[(sel[flgupper] + flgupper*4) *4];
        digit[1] <= x[(sel[flgupper] + flgupper*4) *4 + 1]; 
        digit[2] <= x[(sel[flgupper] + flgupper*4) *4 + 2];
        digit[3] <= x[(sel[flgupper] + flgupper*4) *4 + 3];
        //显示低16位的时候dp亮最右边的，高16位的时候dp亮倒数第二个
        if (flgupper == 1'b0 && sel[0] == 0)
            //低16位且控制最右边的一位时，亮小数点
            dp <= 1'b0;
        else if (flgupper == 1'b1 && sel[1] == 1)
            //高16位且控制倒数第二位时，亮小数点
            dp <= 1'b0;
        else
            //其他情况小数点不亮
            dp <= 1'b1;
        
    end
    //------------------------------
    //数字转换为数码管的7~1位
    function [6:0] btohDISP; 
        input[3:0] digit;
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
    //------------------------------
    //显示
    always @(posedge CLK) begin
        if (e && counter == FREQ )
            //把各个位组合起来显示在数码管上
            DISP <= {posb, btohDISP(digit), dp}; 
    end


endmodule