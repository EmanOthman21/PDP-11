vsim -gui work.in_decoder
# vsim -gui work.in_decoder 
# Start time: 17:55:14 on Jan 14,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.in_decoder(ain_decoder)
add wave -position insertpoint  \
sim:/in_decoder/out_in_decoder \
sim:/in_decoder/selections
force -freeze sim:/in_decoder/selections 000 0
run
force -freeze sim:/in_decoder/selections 001 0
run
force -freeze sim:/in_decoder/selections 010 0
run
force -freeze sim:/in_decoder/selections 011 0
run
force -freeze sim:/in_decoder/selections 100 0
run
force -freeze sim:/in_decoder/selections 101 0
run