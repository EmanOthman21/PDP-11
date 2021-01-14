vsim -gui work.mux1

add wave -position insertpoint  \
sim:/mux1/selectors \
sim:/mux1/srcMode \
sim:/mux1/destMode \
sim:/mux1/noOpCode \
sim:/mux1/output

force -freeze sim:/mux1/noOpCode 0 0
force -freeze sim:/mux1/destMode 3'h7 0
force -freeze sim:/mux1/srcMode 3'h1 0
force -freeze sim:/mux1/selectors 3'h1 0
run
force -freeze sim:/mux1/srcMode 3'h0 0
run
force -freeze sim:/mux1/srcMode 3'h1 0
force -freeze sim:/mux1/selectors 3'h0 0
run
force -freeze sim:/mux1/selectors 3'h4 0
run -continue
force -freeze sim:/mux1/selectors 3'h5 0
run
force -freeze sim:/mux1/noOpCode 1 0
run
force -freeze sim:/mux1/selectors 3'h4 0
run 
force -freeze sim:/mux1/selectors 3'h6 0
run
force -freeze sim:/mux1/selectors 3'h7 0
run

