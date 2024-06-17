set_property -dict {PACKAGE_PIN N21 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_r[0]}]
set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_r[1]}]
set_property -dict {PACKAGE_PIN R21 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_r[2]}]
set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_r[3]}]
set_property -dict {PACKAGE_PIN R22 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_g[0]}]
set_property -dict {PACKAGE_PIN R23 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_g[1]}]
set_property -dict {PACKAGE_PIN T24 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_g[2]}]
set_property -dict {PACKAGE_PIN T25 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_g[3]}]
set_property -dict {PACKAGE_PIN T20 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_b[0]}]
set_property -dict {PACKAGE_PIN R20 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_b[1]}]
set_property -dict {PACKAGE_PIN T22 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_b[2]}]
set_property -dict {PACKAGE_PIN T23 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports {vga_b[3]}]
set_property -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports vsync]
set_property -dict {PACKAGE_PIN M22 IOSTANDARD LVCMOS33 SLEW FAST} [get_ports hsync]
set_property PACKAGE_PIN AC18 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports clk]

set_property PACKAGE_PIN AF10 [get_ports {rst_n}]
set_property IOSTANDARD LVCMOS15 [get_ports {rst_n}]


set_property PACKAGE_PIN AD11       [get_ports speed_mode[1]]
set_property IOSTANDARD LVCMOS15    [get_ports speed_mode[1]]
set_property PACKAGE_PIN Y12       [get_ports speed_mode[0]]
set_property IOSTANDARD LVCMOS15    [get_ports speed_mode[0]]





set_property PACKAGE_PIN AF12       [get_ports key]
set_property IOSTANDARD LVCMOS15    [get_ports key]
set_property PACKAGE_PIN AF25 [get_ports beep]
set_property IOSTANDARD LVCMOS33 [get_ports beep]
set_property PACKAGE_PIN N18 [get_ports ps2_clk]
set_property IOSTANDARD LVCMOS33 [get_ports ps2_clk]
set_property PACKAGE_PIN M19 [get_ports ps2_data]
set_property IOSTANDARD LVCMOS33 [get_ports ps2_data]
