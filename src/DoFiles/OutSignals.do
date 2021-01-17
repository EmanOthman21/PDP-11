vsim -gui work.out_decoder
# vsim -gui work.out_decoder 
# Start time: 18:14:27 on Jan 14,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.out_decoder(aout_decoder)
add wave -position insertpoint  \
sim:/out_decoder/out_out_decoder \
sim:/out_decoder/out_selections
force -freeze sim:/out_decoder/out_selections 0000 0
run
force -freeze sim:/out_decoder/out_selections 0001 0
run
force -freeze sim:/out_decoder/out_selections 0010 0
run
force -freeze sim:/out_decoder/out_selections 0011 0
run
force -freeze sim:/out_decoder/out_selections 0100 0
run
force -freeze sim:/out_decoder/out_selections 0101 0
run
force -freeze sim:/out_decoder/out_selections 0110 0
run
force -freeze sim:/out_decoder/out_selections 0111 0
run
force -freeze sim:/out_decoder/out_selections 1000 0
run
force -freeze sim:/out_decoder/out_selections 1001 0
run