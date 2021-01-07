add wave -position insertpoint  \
sim:/alu/A \
sim:/alu/B \
sim:/alu/cout \
sim:/alu/n \
sim:/alu/selector \
sim:/alu/F \
sim:/alu/cin
# ** Warning: (vsim-WLF-5000) WLF file currently in use: vsim.wlf
#           File in use by: DELL-MCC  Hostname: DESKTOP-V4I1126  ProcessID: 40544
#           Attempting to use alternate WLF file "./wlft406mg0".
# ** Warning: (vsim-WLF-5001) Could not open WLF file: vsim.wlf
#           Using alternate file: ./wlft406mg0
force -freeze sim:/alu/A 16#0002 0
force -freeze sim:/alu/B 16#0004 0
force -freeze sim:/alu/selector 00001 0
force -freeze sim:/alu/cin 0 0
run
force -freeze sim:/alu/A 0000000000000011 0
run
force -freeze sim:/alu/selector 00010 0
force -freeze sim:/alu/B 16#0002 0
run
force -freeze sim:/alu/B 1111111111111110 0
run
force -freeze sim:/alu/A 1111111111111101 0
run
force -freeze sim:/alu/B 16#0002 0
run
force -freeze sim:/alu/selector 00011 0
run
force -freeze sim:/alu/B 1111111111111110 0
run
force -freeze sim:/alu/A 16#0003 0
run
force -freeze sim:/alu/B 16#0002 0
run
force -freeze sim:/alu/cin 1 0
run
force -freeze sim:/alu/A 1111111111111101 0
run
force -freeze sim:/alu/B 1111111111111110 0
run
force -freeze sim:/alu/A 16#0003 0
run
force -freeze sim:/alu/selector 00100 0
force -freeze sim:/alu/cin 0 0
force -freeze sim:/alu/A 16#0002 0
force -freeze sim:/alu/B 16#0003 0
run
force -freeze sim:/alu/A 1111111111111110 0
run
force -freeze sim:/alu/B 1111111111111101 0
run
force -freeze sim:/alu/A 16#0002 0
run
force -freeze sim:/alu/selector 00101 0
run
force -freeze sim:/alu/A 1111111111111110 0
run
force -freeze sim:/alu/B 16#0003 0
run
force -freeze sim:/alu/A 16#0002 0
run
force -freeze sim:/alu/cin 1 0
run
force -freeze sim:/alu/B 1111111111111101 0
run
force -freeze sim:/alu/A 16#FFFE 0
run
force -freeze sim:/alu/B 16#0003 0
run
force -freeze sim:/alu/selector 00110 0
force -freeze sim:/alu/A 1111111111111111 0
run
force -freeze sim:/alu/A 16#0002 0
run
force -freeze sim:/alu/selector 00111 0
run
force -freeze sim:/alu/A 16#FFFF 0
run
force -freeze sim:/alu/selector 01000 0
run
force -freeze sim:/alu/A 16#0003 0
run
force -freeze sim:/alu/selector 01001 0
force -freeze sim:/alu/B 0000000000000010 0
run
force -freeze sim:/alu/A 1111111111111101 0
run
force -freeze sim:/alu/B 16#FFFE 0
run
force -freeze sim:/alu/A 16#0003 0
run
force -freeze sim:/alu/selector 01010 0
run
force -freeze sim:/alu/B 1111111111111111 0
run
force -freeze sim:/alu/B 16#0002 0
run
force -freeze sim:/alu/selector 01011 0
run
force -freeze sim:/alu/B 0000000000000000 0
run
force -freeze sim:/alu/B 16#FFFF 0
run
force -freeze sim:/alu/selector 01100 0
run
force -freeze sim:/alu/selector 01101 0
run
force -freeze sim:/alu/B 16#0000 0
run
force -freeze sim:/alu/selector 01110 0
force -freeze sim:/alu/B 0000000000000001 0
run
force -freeze sim:/alu/B 0000000000000010 0
run
force -freeze sim:/alu/selector 01111 0
run
force -freeze sim:/alu/B 0000000000000001 0
run
force -freeze sim:/alu/selector 10000 0
force -freeze sim:/alu/B 16#8001 0
run
force -freeze sim:/alu/selector 10001 0
run
force -freeze sim:/alu/selector 10010 0
run