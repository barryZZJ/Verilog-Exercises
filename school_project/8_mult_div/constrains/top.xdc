#时钟
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

#16个开关输入
set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property PACKAGE_PIN V15 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property PACKAGE_PIN W14 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property PACKAGE_PIN W13 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
set_property PACKAGE_PIN V2 [get_ports {sw[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
set_property PACKAGE_PIN T3 [get_ports {sw[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
set_property PACKAGE_PIN T2 [get_ports {sw[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
set_property PACKAGE_PIN R3 [get_ports {sw[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
set_property PACKAGE_PIN W2 [get_ports {sw[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
set_property PACKAGE_PIN U1 [get_ports {sw[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
set_property PACKAGE_PIN T1 [get_ports {sw[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
set_property PACKAGE_PIN R2 [get_ports {sw[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]

#左右按键
set_property PACKAGE_PIN W19 [get_ports btna]
set_property IOSTANDARD LVCMOS33 [get_ports btna]
set_property PACKAGE_PIN T17 [get_ports btnb]
set_property IOSTANDARD LVCMOS33 [get_ports btnb]

#上键控制乘除法
set_property PACKAGE_PIN T18 [get_ports mult_div]
set_property IOSTANDARD LVCMOS33 [get_ports mult_div]

#中键显示结果
set_property PACKAGE_PIN U18 [get_ports calc]
set_property IOSTANDARD LVCMOS33 [get_ports calc]

#下键复位
set_property PACKAGE_PIN U17 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

#操作数控制辅助显示led
set_property PACKAGE_PIN U16 [get_ports ldb]
set_property IOSTANDARD LVCMOS33 [get_ports ldb]
set_property PACKAGE_PIN E19 [get_ports lda]
set_property IOSTANDARD LVCMOS33 [get_ports lda]
set_property PACKAGE_PIN U19 [get_ports ldcalc]
set_property IOSTANDARD LVCMOS33 [get_ports ldcalc]
set_property PACKAGE_PIN L1 [get_ports ldmd]
set_property IOSTANDARD LVCMOS33 [get_ports ldmd]

##TODO debug
#set_property PACKAGE_PIN V14 [get_ports debugldr_d]
#set_property IOSTANDARD LVCMOS33 [get_ports debugldr_d]
#set_property PACKAGE_PIN U14 [get_ports debugldr]
#set_property IOSTANDARD LVCMOS33 [get_ports debugldr]


#[11:0]数码管
set_property PACKAGE_PIN W4 [get_ports {DISP[11]}]
set_property PACKAGE_PIN V4 [get_ports {DISP[10]}]
set_property PACKAGE_PIN U4 [get_ports {DISP[9]}]
set_property PACKAGE_PIN U2 [get_ports {DISP[8]}]
set_property PACKAGE_PIN W7 [get_ports {DISP[7]}]
set_property PACKAGE_PIN W6 [get_ports {DISP[6]}]
set_property PACKAGE_PIN U8 [get_ports {DISP[5]}]
set_property PACKAGE_PIN V8 [get_ports {DISP[4]}]
set_property PACKAGE_PIN U5 [get_ports {DISP[3]}]
set_property PACKAGE_PIN V5 [get_ports {DISP[2]}]
set_property PACKAGE_PIN U7 [get_ports {DISP[1]}]
set_property PACKAGE_PIN V7 [get_ports {DISP[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DISP[0]}]

