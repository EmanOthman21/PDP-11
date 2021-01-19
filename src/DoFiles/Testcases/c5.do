vsim -gui work.controlmanager_entity(controlmanager)
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
mem load -i G:/intelFPGA_lite/Arch_PROJECT_FINAL/c5.mem -format binary /controlmanager_entity/ControlWordComponent/RAMComponent/ram
force -freeze sim:/controlmanager_entity/RESET 1 0
run
noforce sim:/controlmanager_entity/uPC
force -freeze sim:/controlmanager_entity/RESET 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run