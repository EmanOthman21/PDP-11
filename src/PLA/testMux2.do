vsim work.mux2

add wave -position insertpoint  \
sim:/mux2/selectors \
sim:/mux2/twoOperandCode \
sim:/mux2/oneOperandCode \
sim:/mux2/output

force -freeze sim:/mux2/selectors 2'h0 0
force -freeze sim:/mux2/oneOperandCode 4'h8 0
force -freeze sim:/mux2/twoOperandCode 4'hF 0
run
force -freeze sim:/mux2/selectors 2'h3 0
run
force -freeze sim:/mux2/selectors 2'h1 0
run
force -freeze sim:/mux2/twoOperandCode 4'h0 0
run
force -freeze sim:/mux2/selectors 2'h2 0
run
