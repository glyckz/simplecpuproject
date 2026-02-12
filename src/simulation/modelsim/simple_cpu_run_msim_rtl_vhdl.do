transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/simple_cpu.vhd}
vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/VHDLSource/Z_ff.vhd}
vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/VHDLSource/tri_state_model.vhd}
vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/VHDLSource/opcode_decoder.vhd}
vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/VHDLSource/instruction_sequencer.vhd}
vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/VHDLSource/fulladder.vhd}
vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/VHDLSource/dreg_e.vhd}
vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/VHDLSource/datapath.vhd}
vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/VHDLSource/d_ff.vhd}
vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/VHDLSource/control_signals_logic.vhd}
vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/VHDLSource/alu.vhd}
vcom -2008 -work work {C:/Users/kcngn/SimpleCPUProject/VHDLSource/adder_subtractor.vhd}

