## Ceasul sistemului (100 MHz)
set_property PACKAGE_PIN W5 [get_ports CLK]							
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]
 
## Intrare Serială (S_in) - mapată pe Switch-ul 0 (SW0)
set_property PACKAGE_PIN V17 [get_ports S_in]					
set_property IOSTANDARD LVCMOS33 [get_ports S_in]

## Reset (RST) - mapat pe Switch-ul 15 (SW15 - extrema stângă)
set_property PACKAGE_PIN R2 [get_ports RST]						
set_property IOSTANDARD LVCMOS33 [get_ports RST]

## LED-uri (Data_leds) - arată starea registrului de deplasare (LD3 până la LD0)
set_property PACKAGE_PIN U16 [get_ports {Data_leds[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Data_leds[0]}]
set_property PACKAGE_PIN E19 [get_ports {Data_leds[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Data_leds[1]}]
set_property PACKAGE_PIN U19 [get_ports {Data_leds[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Data_leds[2]}]
set_property PACKAGE_PIN V19 [get_ports {Data_leds[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Data_leds[3]}]

## Catozii pentru Afișajul cu 7 Segmente (Cathodes 7 downto 0)
set_property PACKAGE_PIN W7 [get_ports {Cathodes[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Cathodes[0]}]
set_property PACKAGE_PIN W6 [get_ports {Cathodes[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Cathodes[1]}]
set_property PACKAGE_PIN U8 [get_ports {Cathodes[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Cathodes[2]}]
set_property PACKAGE_PIN V8 [get_ports {Cathodes[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Cathodes[3]}]
set_property PACKAGE_PIN U5 [get_ports {Cathodes[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Cathodes[4]}]
set_property PACKAGE_PIN V5 [get_ports {Cathodes[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Cathodes[5]}]
set_property PACKAGE_PIN U7 [get_ports {Cathodes[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Cathodes[6]}]
set_property PACKAGE_PIN V7 [get_ports {Cathodes[7]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Cathodes[7]}]

## Anozi (Anodes 3 downto 0)
set_property PACKAGE_PIN U2 [get_ports {Anodes[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Anodes[0]}]
set_property PACKAGE_PIN U4 [get_ports {Anodes[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Anodes[1]}]
set_property PACKAGE_PIN V4 [get_ports {Anodes[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Anodes[2]}]
set_property PACKAGE_PIN W4 [get_ports {Anodes[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {Anodes[3]}]