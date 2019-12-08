#0~7开关对应输入
set_property PACKAGE_PIN V17 [get_ports {din[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[7]}]
set_property PACKAGE_PIN V16 [get_ports {din[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[6]}]
set_property PACKAGE_PIN W16 [get_ports {din[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[5]}]
set_property PACKAGE_PIN W17 [get_ports {din[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[4]}]
set_property PACKAGE_PIN W15 [get_ports {din[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[3]}]
set_property PACKAGE_PIN V15 [get_ports {din[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[2]}]
set_property PACKAGE_PIN W14 [get_ports {din[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[1]}]
set_property PACKAGE_PIN W13 [get_ports {din[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[0]}]

#14开关复位，15开关读
set_property PACKAGE_PIN T1 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN R2 [get_ports read]
set_property IOSTANDARD LVCMOS33 [get_ports read]

#时钟
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

#模拟时钟按键
set_property PACKAGE_PIN U18 [get_ports btnclk]
set_property IOSTANDARD LVCMOS33 [get_ports btnclk]

#复位提示灯
set_property PACKAGE_PIN P1 [get_ports ldrst]
set_property IOSTANDARD LVCMOS33 [get_ports ldrst]
#clk脉冲提示灯
set_property PACKAGE_PIN L1 [get_ports ldclk]
set_property IOSTANDARD LVCMOS33 [get_ports ldclk]
#含1011序列提示灯
set_property PACKAGE_PIN N3 [get_ports ldres]
set_property IOSTANDARD LVCMOS33 [get_ports ldres]

