
## Nexys A7-100T - FSM Constraints

## 100 MHz clock
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk [get_ports clk]

## Reset - SW0
set_property PACKAGE_PIN J15 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## Input x - SW1
set_property PACKAGE_PIN L16 [get_ports x]
set_property IOSTANDARD LVCMOS33 [get_ports x]

## Output y - LED0
set_property PACKAGE_PIN H17 [get_ports y]
set_property IOSTANDARD LVCMOS33 [get_ports y]
