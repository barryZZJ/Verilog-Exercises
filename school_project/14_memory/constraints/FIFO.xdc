#时钟
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]

set_property PACKAGE_PIN T1 [get_ports rd_en]
set_property IOSTANDARD LVCMOS33 [get_ports rd_en]
set_property PACKAGE_PIN R2 [get_ports wr_en]
set_property IOSTANDARD LVCMOS33 [get_ports wr_en]

set_property PACKAGE_PIN U18 [get_ports btnclk]
set_property IOSTANDARD LVCMOS33 [get_ports btnclk]

set_property PACKAGE_PIN T18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

set_property PACKAGE_PIN U16 [get_ports {data_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[0]}]
set_property PACKAGE_PIN E19 [get_ports {data_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[1]}]
set_property PACKAGE_PIN U19 [get_ports {data_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[2]}]
set_property PACKAGE_PIN V19 [get_ports {data_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[3]}]

set_property PACKAGE_PIN P1 [get_ports empty]
set_property IOSTANDARD LVCMOS33 [get_ports empty]
set_property PACKAGE_PIN L1 [get_ports full]
set_property IOSTANDARD LVCMOS33 [get_ports full]