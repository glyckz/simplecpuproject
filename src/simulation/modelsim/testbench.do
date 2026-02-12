vcom -2008 -work work {..\..\eeprom_memory.vhd}
vcom -2008 -work work {..\..\clock_reset_generation.vhd}
vcom -2008 -work work {..\..\simple_cpu_testbench.vhd}

vsim simple_cpu_testbench

add wave -position insertpoint sim:/simple_cpu_testbench/address_bus
add wave -position insertpoint sim:/simple_cpu_testbench/data_bus
add wave -position insertpoint sim:/simple_cpu_testbench/clock
add wave -position insertpoint sim:/simple_cpu_testbench/r
add wave -position insertpoint sim:/simple_cpu_testbench/w
add wave -radix dec -position insertpoint sim:/simple_cpu_testbench/b2v_memory_0/memory_contents

run 100000 ns