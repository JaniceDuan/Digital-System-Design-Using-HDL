set_property PACKAGE_PIN L1 [get_ports {cnt_s1[15]}]
set_property PACKAGE_PIN P1 [get_ports {cnt_s1[14]}]
set_property PACKAGE_PIN N3 [get_ports {cnt_s1[13]}]
set_property PACKAGE_PIN P3 [get_ports {cnt_s1[12]}]
set_property PACKAGE_PIN U3 [get_ports {cnt_s1[11]}]
set_property PACKAGE_PIN W3 [get_ports {cnt_s1[10]}]
set_property PACKAGE_PIN V3 [get_ports {cnt_s1[9]}]
set_property PACKAGE_PIN V13 [get_ports {cnt_s1[8]}]
set_property PACKAGE_PIN V14 [get_ports {cnt_s1[7]}]
set_property PACKAGE_PIN U14 [get_ports {cnt_s1[6]}]
set_property PACKAGE_PIN U15 [get_ports {cnt_s1[5]}]
set_property PACKAGE_PIN W18 [get_ports {cnt_s1[4]}]
set_property PACKAGE_PIN V19 [get_ports {cnt_s1[3]}]
set_property PACKAGE_PIN U19 [get_ports {cnt_s1[2]}]
set_property PACKAGE_PIN E19 [get_ports {cnt_s1[1]}]
set_property PACKAGE_PIN U16 [get_ports {cnt_s1[0]}]


set_property PACKAGE_PIN W7 [get_ports {cathodes[0]}]
set_property PACKAGE_PIN W6 [get_ports {cathodes[1]}]
set_property PACKAGE_PIN U8 [get_ports {cathodes[2]}]
set_property PACKAGE_PIN V8 [get_ports {cathodes[3]}]
set_property PACKAGE_PIN U5 [get_ports {cathodes[4]}]
set_property PACKAGE_PIN V5 [get_ports {cathodes[5]}]
set_property PACKAGE_PIN U7 [get_ports {cathodes[6]}]
set_property PACKAGE_PIN V7 [get_ports {cathodes[7]}]


set_property PACKAGE_PIN W4 [get_ports {AN[3]}]
set_property PACKAGE_PIN V4 [get_ports {AN[2]}]
set_property PACKAGE_PIN U4 [get_ports {AN[1]}]
set_property PACKAGE_PIN U2 [get_ports {AN[0]}]

set_property PACKAGE_PIN W5 [get_ports {sysclk}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {sysclk}]
create_clock -period 10.000 -name CLK -waveform {0.000 5.000} [get_ports sysclk]
set_property PACKAGE_PIN T18 [get_ports {U}]
set_property PACKAGE_PIN W19 [get_ports {L}]
set_property PACKAGE_PIN T17 [get_ports {R}]
set_property PACKAGE_PIN U17 [get_ports {D}]

set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cnt_s1[15]}]



set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[7]}]


set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {sysclk}]
set_property IOSTANDARD LVCMOS33 [get_ports {U}]
set_property IOSTANDARD LVCMOS33 [get_ports {L}]
set_property IOSTANDARD LVCMOS33 [get_ports {R}]
set_property IOSTANDARD LVCMOS33 [get_ports {D}]

set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]

