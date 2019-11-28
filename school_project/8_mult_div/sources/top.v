//16位乘除法器
//实现过程：
//4个数码管正好显示一个16位操作数，按键左右控制输入第几个操作数，左右LED1、LED0亮加以辅助显示
//16个开关一次性输入一个操作数
//上按键控制乘除法（默认乘法），LED15亮灭辅助显示（默认亮）
//中间键显示结果，LED2亮灭辅助显示
//下按键复位
//乘法时，结果为32位，数码管依次显示低16位和高16位，通过小数点的位置表示是低还是高
//除法时，结果为16为，4个数码管正好显示

module top #(parameter FREQ = 10**5/2,
             parameter INTERVAL = 10**8,
             parameter T40MS = 40*10**5)
            (input clk,
             input [15:0] sw, //开关输入操作数
             input btna, //控制输入第一个操作数
             input btnb, //控制输入第二个操作数
             input mult_div, //按键上控制乘除法
             input calc, //中间键显示结果
             input rst, //下按键复位
             output reg lda, //中间led
             output reg ldb, //右边led
             output ldcalc, //左边led
             output ldmd, //乘除法led显示，乘法时亮，除法时灭
             output reg [11:0] DISP //数码管
);

//---------------------------------
//按键防抖
wire btna_d;
wire btnb_d;
wire mult_div_d;
wire calc_d;
wire rst_d;

debkey #(T40MS) ukey_l (clk, btna, btna_d);
debkey #(T40MS) ukey_r (clk, btnb, btnb_d);
debkey #(T40MS) ukey_u (clk, mult_div, mult_div_d);
debkey #(T40MS) ukey_c (clk, calc, calc_d);
debkey #(T40MS) ukey_d (clk, rst, rst_d);
//--------------------------------
//操作数控制与输入
reg flga = 1'b1; //默认输入第一个操作数

reg [15:0] a;
reg [15:0] b;

always @(posedge clk) begin
    if (rst_d) begin
        flga <= 1'b1;
        read <= 1'b1;
    end else begin
        if (!flgcalc) begin
            if (btna_d) flga <= 1'b1;
            if (btnb_d) flga <= 1'b0;
        //如果正在显示结果则输入开关不起作用
            if (flga) begin
                a <= sw;
                read <= 1'b1; //写入数据时读
                lda <= 1'b1;
                ldb <= 1'b0;
            end else begin
                b <= sw;
                read <= 1'b1; //写入数据时读
                lda <= 1'b0;
                ldb <= 1'b1;
            end
        end else begin
            //计算时不读
            read <= 1'b0;
            lda <= 1'b0;
            ldb <= 1'b0;
        end
    end
end
//------------------------------
// 计算模块实例化
reg em; //乘法器使能，关闭时保持原来的结果，开启时计算器进行计算
reg ed; //除法器使能，关闭时保持原来的结果，开启时计算器进行计算
reg read; //read要提前设置为1，read为1时读数据并初始化模块内部变量，为0时计算

wire done; //是否完成计算
wire done_m;
wire done_d;

assign done = done_m | done_d;

wire [31:0] mult_s; //乘法结果
wire [15:0] div_q; //除法结果商
wire [15:0] div_r; //除法余数

multiplier #(16) u_mult (clk, em, read, a, b, mult_s, done_m);
divider #(16) u_div (clk, ed, read, a, b, div_q, div_r, done_d);
//------------------------------
//开始计算

reg flgcalc = 1'b0; //是否计算

assign ldcalc = flgcalc; 

//打开对应计算器的使能开关
always @(posedge clk) begin
    if (rst_d) begin
        flgcalc <= 1'b0;
        em <= 1'b0;
        ed <= 1'b0;
    end else begin
        //计算完成后关闭计算开关，开始显示
        if (done) begin
            em <= 1'b0;
            ed <= 1'b0;
        end else if (~flga & calc_d & ~flgcalc) begin //'~flga'防止只输入一个操作数，'~flgcalc'防止按下按钮没松开的时候一直执行
            flgcalc <= 1'b1;
            if (flgmult) begin
            //乘法
                em <= 1'b1;
                ed <= 1'b0;
            end else begin
            //除法
                em <= 1'b0;
                ed <= 1'b1;
            end
        end

    end
end

//------------------------------
//控制切换乘除法
reg flgmult = 1'b1; //默认做乘法

assign ldmd = flgmult; //辅助显示当前计算方法

always @(posedge mult_div_d)
    flgmult <= ~flgmult;
//------------------------------
//显示操作数到数码管
wire [11:0] DISPa;
wire [11:0] DISPb;
wire [11:0] DISPm;
wire [11:0] DISPd;

//第一个操作数
display_16bto4h_e #(FREQ) u_disp_a (clk, flga & ~flgcalc, a, DISPa);
//第二个操作数
display_16bto4h_e #(FREQ) u_disp_b (clk, ~flga & ~flgcalc, b, DISPb);

//如果已经开始计算并且计算完毕，则显示
//16位除法结果显示模块
display_16bto4h_e #(FREQ) u_disp_div (clk, ~flgmult & flgcalc & done, div_q, DISPd);
//32位乘法结果分段显示模块
display_32bto4h_e #(FREQ, INTERVAL) u_disp_mult (clk, flgmult & flgcalc & done, mult_s, DISPm);

//------------------------------
//控制显示哪一个结果
always @(posedge clk) begin
    if (rst_d)
        DISP <= 12'hffff;
    else if (flga & ~flgcalc)
        DISP <= DISPa;
    else if (~flga & ~flgcalc)
        DISP <= DISPb;
    else if (flgmult & flgcalc & done)
        DISP <= DISPm;
    else if (~flgmult & flgcalc & done)
        DISP <= DISPd;
end

//------------------------------

endmodule 