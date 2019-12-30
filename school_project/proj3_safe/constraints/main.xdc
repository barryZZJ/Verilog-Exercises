#时钟
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

#开关7~0设置密码
set_property PACKAGE_PIN V17 [get_ports {din[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[0]}]
set_property PACKAGE_PIN V16 [get_ports {din[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[1]}]
set_property PACKAGE_PIN W16 [get_ports {din[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[2]}]
set_property PACKAGE_PIN W17 [get_ports {din[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[3]}]
set_property PACKAGE_PIN W15 [get_ports {din[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[4]}]
set_property PACKAGE_PIN V15 [get_ports {din[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[5]}]
set_property PACKAGE_PIN W14 [get_ports {din[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[6]}]
set_property PACKAGE_PIN W13 [get_ports {din[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[7]}]

#ld7~0提示密码
set_property PACKAGE_PIN U16 [get_ports {lddin[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lddin[0]}]
set_property PACKAGE_PIN E19 [get_ports {lddin[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lddin[1]}]
set_property PACKAGE_PIN U19 [get_ports {lddin[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lddin[2]}]
set_property PACKAGE_PIN V19 [get_ports {lddin[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lddin[3]}]
set_property PACKAGE_PIN W18 [get_ports {lddin[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lddin[4]}]
set_property PACKAGE_PIN U15 [get_ports {lddin[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lddin[5]}]
set_property PACKAGE_PIN U14 [get_ports {lddin[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lddin[6]}]
set_property PACKAGE_PIN V14 [get_ports {lddin[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lddin[7]}]

#开关14rst
set_property PACKAGE_PIN T1 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]


#模拟时钟，中键
set_property PACKAGE_PIN U18 [get_ports btnclk]
set_property IOSTANDARD LVCMOS33 [get_ports btnclk]

#左键输入0。右键输入1。上键输入2.下键输入3.
set_property PACKAGE_PIN W19 [get_ports btn0]
set_property IOSTANDARD LVCMOS33 [get_ports btn0]
set_property PACKAGE_PIN T17 [get_ports btn1]
set_property IOSTANDARD LVCMOS33 [get_ports btn1]
set_property PACKAGE_PIN T18 [get_ports btn2]
set_property IOSTANDARD LVCMOS33 [get_ports btn2]
set_property PACKAGE_PIN U17 [get_ports btn3]
set_property IOSTANDARD LVCMOS33 [get_ports btn3]

#ld15按键提示灯
set_property PACKAGE_PIN L1 [get_ports ldbtn]
set_property IOSTANDARD LVCMOS33 [get_ports ldbtn]

#ld14通过，ld13失败
set_property PACKAGE_PIN N3 [get_ports ldfail]
set_property IOSTANDARD LVCMOS33 [get_ports ldfail]
set_property PACKAGE_PIN P1 [get_ports ldpass]
set_property IOSTANDARD LVCMOS33 [get_ports ldpass]