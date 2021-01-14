vsim -gui work.encoder

add wave -position insertpoint  \
sim:/encoder/input \
sim:/encoder/output
force -freeze sim:/encoder/input 4'h1 0
run
force -freeze sim:/encoder/input 4'h2 0
run
force -freeze sim:/encoder/input 4'h4 0
run
force -freeze sim:/encoder/input 4'h8 0
run


