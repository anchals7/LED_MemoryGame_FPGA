# Clock pin
set_property PACKAGE_PIN E3 [get_ports clk];
	set_property IOSTANDARD LVCMOS33 [get_ports clk];
	create_clock -add -name clk -period 10.00 [get_ports clk]



# Reset button
set_property PACKAGE_PIN C12 [get_ports rst];
set_property IOSTANDARD LVCMOS33 [get_ports rst];


# LEDs
set_property PACKAGE_PIN H17 [get_ports {led[0]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}];

set_property PACKAGE_PIN K15 [get_ports {led[1]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}];

set_property PACKAGE_PIN J13 [get_ports {led[2]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}];

set_property PACKAGE_PIN N14 [get_ports {led[3]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}];

set_property PACKAGE_PIN R18 [get_ports {led[4]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}];

set_property PACKAGE_PIN V17 [get_ports {led[5]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}];

set_property PACKAGE_PIN U17 [get_ports {led[6]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}];

set_property PACKAGE_PIN U16 [get_ports {led[7]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}];

set_property PACKAGE_PIN V16 [get_ports {led[8]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}];

set_property PACKAGE_PIN T15 [get_ports {led[9]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}];

set_property PACKAGE_PIN U14 [get_ports {led[10]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}];

set_property PACKAGE_PIN T16 [get_ports {led[11]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}];

set_property PACKAGE_PIN V15 [get_ports {led[12]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}];

set_property PACKAGE_PIN V14 [get_ports {led[13]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}];

set_property PACKAGE_PIN V12 [get_ports {led[14]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}];

set_property PACKAGE_PIN V11 [get_ports {led[15]}]; 
set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}];




# Switches
#Bank = 34, Pin name = IO_L21P_T3_DQS_34,					Sch name = Sw0
set_property PACKAGE_PIN J15 [get_ports {sw[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
	
#Bank = 34, Pin name = IO_25_34,							Sch name = Sw1
set_property PACKAGE_PIN L16 [get_ports {sw[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
	
#Bank = 34, Pin name = IO_L23P_T3_34,						Sch name = Sw2
set_property PACKAGE_PIN M13 [get_ports {sw[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
	
#Bank = 34, Pin name = IO_L19P_T3_34,						Sch name = Sw3
set_property PACKAGE_PIN R15 [get_ports {sw[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
	
#Bank = 34, Pin name = IO_L19N_T3_VREF_34,					Sch name = Sw4
set_property PACKAGE_PIN R17 [get_ports {sw[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
	
#Bank = 34, Pin name = IO_L20P_T3_34,						Sch name = Sw5
set_property PACKAGE_PIN T18 [get_ports {sw[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
	
#Bank = 34, Pin name = IO_L20N_T3_34,						Sch name = Sw6
set_property PACKAGE_PIN U18 [get_ports {sw[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
	
#Bank = 34, Pin name = IO_L10P_T1_34,						Sch name = Sw7
set_property PACKAGE_PIN R13 [get_ports {sw[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]

#Bank = 34, Pin name = IO_L8P_T1-34,						Sch name = Sw8
set_property PACKAGE_PIN T8 [get_ports {sw[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]

#Bank = 34, Pin name = IO_L9N_T1_DQS_34,					Sch name = Sw9
set_property PACKAGE_PIN U8 [get_ports {sw[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]

#Bank = 34, Pin name = IO_L9P_T1_DQS_34,					Sch name = Sw10
set_property PACKAGE_PIN R16 [get_ports {sw[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]

#Bank = 34, Pin name = IO_L11N_T1_MRCC_34,					Sch name = Sw11
set_property PACKAGE_PIN T13 [get_ports {sw[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]

#Bank = 34, Pin name = IO_L17N_T2_34,						Sch name = Sw12
set_property PACKAGE_PIN H6 [get_ports {sw[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]

#Bank = 34, Pin name = IO_L11P_T1_SRCC_34,					Sch name = Sw13
set_property PACKAGE_PIN U12 [get_ports {sw[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]

#Bank = 34, Pin name = IO_L14N_T2_SRCC_34,					Sch name = Sw14
set_property PACKAGE_PIN U11 [get_ports {sw[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]

#Bank = 34, Pin name = IO_L14P_T2_SRCC_34,					Sch name = Sw15
set_property PACKAGE_PIN V10 [get_ports {sw[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
 