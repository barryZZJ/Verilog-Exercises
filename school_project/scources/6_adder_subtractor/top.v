//将加减法器模块和7段数码管显示模块连接起来，
//将SW15~SW12作为第一操作数低4位，SW11~SW8作为第二操作数低4位，
//SW0=0（1）时做加（减）法，
//添加选择控制SW1~SW2，能选择将操作数1或操作数2或结果显示在7段数码管上。
module top #(parameter INTERVAL = 10**5/2)
          (input CLK,
           input[3:0] a, //sw15~sw12
           input[3:0] b, //sw11~sw8
           input add_sub_signal, //sw0
           input[1:0] operand_control, //sw1~sw2
           output[11:0] DISP);

    wire[31:0] s_add;
    wire[31:0] s_sub;
    reg[31:0] s;
    
    full_adder_32 u_fadder_32(1'b0, {28'b0,a}, {28'b0,b}, s_add);
    full_subtractor_32 u_fsub_32({28'b0,a}, {28'b0,b}, s_sub);

    display_16bto4h #(INTERVAL) u_disp(CLK, s[15:0], DISP);

    always @(a, b, add_sub_signal, operand_control, s_add, s_sub) begin
        case (operand_control)
            0: begin //显示结果
                case (add_sub_signal)
                    0: s = s_add;
                    1: s = s_sub;
                    default: s = 32'bx;
                endcase
               end
            1: s = {28'b0,a}; //第一个操作数
            2: s = {28'b0,b}; //第二个操作数
            default: s = 32'bx;
            
        endcase
    end

endmodule