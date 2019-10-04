#时钟
set_property PACKAGE_PIN W5 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]

#复位键（引脚默认是中间按钮U18）
set_property PACKAGE_PIN U18 [get_ports RST]
set_property IOSTANDARD LVCMOS33 [get_ports RST]

#[15:0]开关
set_property PACKAGE_PIN V17 [get_ports A]
set_property IOSTANDARD LVCMOS33 [get_ports A]
set_property PACKAGE_PIN V16 [get_ports B]
set_property IOSTANDARD LVCMOS33 [get_ports B]

#[15:0]LED
set_property PACKAGE_PIN U16 [get_ports GT]
set_property IOSTANDARD LVCMOS33 [get_ports GT]
set_property PACKAGE_PIN E19 [get_ports EQ]
set_property IOSTANDARD LVCMOS33 [get_ports EQ]
set_property PACKAGE_PIN U19 [get_ports LT]
set_property IOSTANDARD LVCMOS33 [get_ports LT]