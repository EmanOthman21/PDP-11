vsim -gui work.mux3

add wave -position insertpoint  \
sim:/mux3/selectors \
sim:/mux3/destMode \
sim:/mux3/output

force -freeze sim:/mux3/selectors 1 0
force -freeze sim:/mux3/destMode 3'h3 0
run
force -freeze sim:/mux3/destMode 3'h0 0
run
force -freeze sim:/mux3/selectors 0 0
run
force -freeze sim:/mux3/destMode 3'h6 0
run
force -freeze sim:/mux3/destMode 3'h3 0
run


