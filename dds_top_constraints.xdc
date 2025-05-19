# ======= Clock Input =======
set_property PACKAGE_PIN C9 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]

# ======= Switches SW0-SW7 (key_in[7:0]) =======
set_property PACKAGE_PIN U20 [get_ports {key_in[0]}]
set_property PACKAGE_PIN V20 [get_ports {key_in[1]}]
set_property PACKAGE_PIN W20 [get_ports {key_in[2]}]
set_property PACKAGE_PIN U19 [get_ports {key_in[3]}]
set_property PACKAGE_PIN V19 [get_ports {key_in[4]}]
set_property PACKAGE_PIN W19 [get_ports {key_in[5]}]
set_property PACKAGE_PIN U18 [get_ports {key_in[6]}]
set_property PACKAGE_PIN V18 [get_ports {key_in[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_in[*]}]

# ======= Waveform Select (sel[1:0]) =======
set_property PACKAGE_PIN U10 [get_ports {sel[0]}]  # SW8
set_property PACKAGE_PIN V10 [get_ports {sel[1]}]  # SW9
set_property IOSTANDARD LVCMOS33 [get_ports {sel[*]}]

# ======= Button BTN0 as rst_n_shiji =======
set_property PACKAGE_PIN U14 [get_ports rst_n_shiji]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n_shiji]

# ======= Segment Display Left (l_seg[6:0]) =======
set_property PACKAGE_PIN G15 [get_ports {l_seg[0]}]
set_property PACKAGE_PIN F15 [get_ports {l_seg[1]}]
set_property PACKAGE_PIN E15 [get_ports {l_seg[2]}]
set_property PACKAGE_PIN D15 [get_ports {l_seg[3]}]
set_property PACKAGE_PIN C15 [get_ports {l_seg[4]}]
set_property PACKAGE_PIN B15 [get_ports {l_seg[5]}]
set_property PACKAGE_PIN A15 [get_ports {l_seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {l_seg[*]}]

# ======= Segment Display Left Anodes (l_dis[3:0]) =======
set_property PACKAGE_PIN M17 [get_ports {l_dis[0]}]
set_property PACKAGE_PIN M18 [get_ports {l_dis[1]}]
set_property PACKAGE_PIN N17 [get_ports {l_dis[2]}]
set_property PACKAGE_PIN N18 [get_ports {l_dis[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {l_dis[*]}]

# ======= Segment Display Right (r_seg[6:0]) =======
# Connect to same pins as l_seg if sharing display
set_property PACKAGE_PIN G15 [get_ports {r_seg[0]}]
set_property PACKAGE_PIN F15 [get_ports {r_seg[1]}]
set_property PACKAGE_PIN E15 [get_ports {r_seg[2]}]
set_property PACKAGE_PIN D15 [get_ports {r_seg[3]}]
set_property PACKAGE_PIN C15 [get_ports {r_seg[4]}]
set_property PACKAGE_PIN B15 [get_ports {r_seg[5]}]
set_property PACKAGE_PIN A15 [get_ports {r_seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r_seg[*]}]

# ======= Segment Display Right Anodes (r_dis[3:0]) =======
set_property PACKAGE_PIN M17 [get_ports {r_dis[0]}]
set_property PACKAGE_PIN M18 [get_ports {r_dis[1]}]
set_property PACKAGE_PIN N17 [get_ports {r_dis[2]}]
set_property PACKAGE_PIN N18 [get_ports {r_dis[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r_dis[*]}]

# ======= sin[7:0] Output to PMOD (e.g., PMOD A - J3) =======
set_property PACKAGE_PIN G14 [get_ports {sin[0]}]
set_property PACKAGE_PIN G13 [get_ports {sin[1]}]
set_property PACKAGE_PIN F14 [get_ports {sin[2]}]
set_property PACKAGE_PIN F13 [get_ports {sin[3]}]
set_property PACKAGE_PIN E14 [get_ports {sin[4]}]
set_property PACKAGE_PIN E13 [get_ports {sin[5]}]
set_property PACKAGE_PIN D14 [get_ports {sin[6]}]
set_property PACKAGE_PIN D13 [get_ports {sin[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sin[*]}]

# ======= rst_n_AD[4:0] to LEDs LD0-LD4 =======
set_property PACKAGE_PIN T20 [get_ports {rst_n_AD[0]}]
set_property PACKAGE_PIN U20 [get_ports {rst_n_AD[1]}]
set_property PACKAGE_PIN R19 [get_ports {rst_n_AD[2]}]
set_property PACKAGE_PIN T19 [get_ports {rst_n_AD[3]}]
set_property PACKAGE_PIN V19 [get_ports {rst_n_AD[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst_n_AD[*]}]
