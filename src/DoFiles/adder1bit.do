add wave -position insertpoint  \
sim:/adder1bit/a \
sim:/adder1bit/b \
sim:/adder1bit/cin \
sim:/adder1bit/cout \
sim:/adder1bit/s
force -freeze sim:/adder1bit/a 0 0
force -freeze sim:/adder1bit/b 0 0
force -freeze sim:/adder1bit/cin 0 0
run
force -freeze sim:/adder1bit/cin 1 0
run
force -freeze sim:/adder1bit/cin 0 0
force -freeze sim:/adder1bit/a 1 0
run
force -freeze sim:/adder1bit/a 0 0
force -freeze sim:/adder1bit/b 1 0
run
force -freeze sim:/adder1bit/cin 1 0
run
force -freeze sim:/adder1bit/cin 0 0
force -freeze sim:/adder1bit/a 1 0
run
force -freeze sim:/adder1bit/cin 1 0
run
