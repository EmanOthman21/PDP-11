vsim work.pla

add wave -position insertpoint  \
sim:/pla/operationType \
sim:/pla/IR \
sim:/pla/F9 \
sim:/pla/branchCheck \
sim:/pla/plaOut

force -freeze sim:/pla/operationType 4'h8 0
force -freeze sim:/pla/IR 16'h0810 0
force -freeze sim:/pla/F9 3'h0 0
force -freeze sim:/pla/branchCheck 1 0
run
force -freeze sim:/pla/F9 3'h1 0
run
force -freeze sim:/pla/F9 3'h2 0
run
force -freeze sim:/pla/F9 3'h3 0
run
force -freeze sim:/pla/F9 3'h4 0
run
force -freeze sim:/pla/F9 3'h3 0
force -freeze sim:/pla/IR 16'h0800 0
run
force -freeze sim:/pla/IR 16'h8800 0
run