vsim -gui work.controlmanager_entity(controlmanager)
# vsim -gui work.controlmanager_entity(controlmanager) 
# Start time: 22:53:57 on Jan 18,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.controlmanager_entity(controlmanager)
# Loading ieee.math_real(body)
# Loading work.rom(romarch)
# Loading work.controlword_entity(controlworddecoder)
# Loading work.in_out_enabls(ain_out_enabls)
# Loading work.regester_enabls(aregester_enabls)
# Loading work.decoder(adecoder)
# Loading work.tristate(triarch)
# Loading work.reg(a_reg)
# Loading work.operationsignals(opsignals)
# Loading work.branchflag(branchflagarch)
# Loading work.alu(a_alu)
# Loading work.addernbit(a_addernbit)
# Loading work.adder1bit(a_adder1bit)
# Loading work.flag(flag_arch)
# Loading work.pla(plaarch)
# Loading work.mux1(mux1arch)
# Loading work.mux2(mux2arch)
# Loading work.mux3(mux3arch)
# Loading work.encoder(encoderarch)
# Loading work.ram_entity(ram_memory)
# vsim -gui work.controlmanager_entity(controlmanager) 
# Start time: 22:50:31 on Jan 18,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.controlmanager_entity(controlmanager)
# Loading ieee.math_real(body)
# Loading work.rom(romarch)
# Loading work.controlword_entity(controlworddecoder)
# Loading work.in_out_enabls(ain_out_enabls)
# Loading work.regester_enabls(aregester_enabls)
# Loading work.decoder(adecoder)
# Loading work.tristate(triarch)
# Loading work.reg(a_reg)
# Loading work.operationsignals(opsignals)
# Loading work.branchflag(branchflagarch)
# Loading work.alu(a_alu)
# Loading work.addernbit(a_addernbit)
# Loading work.adder1bit(a_adder1bit)
# Loading work.flag(flag_arch)
# Loading work.pla(plaarch)
# Loading work.mux1(mux1arch)
# Loading work.mux2(mux2arch)
# Loading work.mux3(mux3arch)
# Loading work.encoder(encoderarch)
# Loading work.ram_entity(ram_memory)
add wave -position insertpoint  \
sim:/controlmanager_entity/clk \
sim:/controlmanager_entity/RESET \
sim:/controlmanager_entity/uPC \
sim:/controlmanager_entity/ControlWord
add wave -position insertpoint  \
sim:/controlmanager_entity/ControlWordComponent/MDR \
sim:/controlmanager_entity/ControlWordComponent/MAR \
sim:/controlmanager_entity/ControlWordComponent/R0 \
sim:/controlmanager_entity/ControlWordComponent/R1 \
sim:/controlmanager_entity/ControlWordComponent/R2 \
sim:/controlmanager_entity/ControlWordComponent/R3 \
sim:/controlmanager_entity/ControlWordComponent/R4 \
sim:/controlmanager_entity/ControlWordComponent/R5 \
sim:/controlmanager_entity/ControlWordComponent/R6 \
sim:/controlmanager_entity/ControlWordComponent/PC \
sim:/controlmanager_entity/ControlWordComponent/IR \
sim:/controlmanager_entity/ControlWordComponent/X \
sim:/controlmanager_entity/ControlWordComponent/Y \
sim:/controlmanager_entity/ControlWordComponent/Z \
sim:/controlmanager_entity/ControlWordComponent/DataBus \
sim:/controlmanager_entity/ControlWordComponent/FlagRegister
force -freeze sim:/controlmanager_entity/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/controlmanager_entity/uPC 000000000 0
mem load -i G:/intelFPGA_lite/Arch_Project/c1.mem -format binary /controlmanager_entity/ControlWordComponent/RAMComponent/ram
force -freeze sim:/controlmanager_entity/RESET 1 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 1  Instance: /controlmanager_entity/ControlWordComponent/RAMComponent
noforce sim:/controlmanager_entity/uPC
force -freeze sim:/controlmanager_entity/RESET 0 0