//3位四选一多路选择器（3位代表输入的位数）
//输入[2:0]：a,b,c,d；输出[2:0]：y；选择[1:0]:s
//真值表：
//  s | y
// -------
// 00 | a
// 01 | b
// 10 | c
// 11 | d
//应用：
//SW[13:12]表示2位二进制数作为选择器，
//SW[2:0],SW[5:3],SW[8:6],SW[11:9]为四个输入，分别对应不同的3位二进制数
//LED[2:0]为输出，显示对应输入的二进制值

module mux4_1(input [2:0] a,
              input [2:0] b,
              input [2:0] c,
              input [2:0] d,
              input [1:0] s,
              output reg [2:0] y);
    always @(*) begin
        case (s)
            0: y = a;
            1: y = b;
            2: y = c;
            3: y = d;
            default: y = 4'bx;
        endcase
    end
endmodule