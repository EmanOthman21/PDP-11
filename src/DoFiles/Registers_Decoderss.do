vsim -gui work.decoder(adecoder)
# vsim -gui work.decoder(adecoder) 
# Start time: 17:26:05 on Jan 14,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.decoder(adecoder)
add wave -position insertpoint  \
sim:/decoder/ENABLE \
sim:/decoder/out_decoder \
sim:/decoder/selection
force -freeze sim:/decoder/ENABLE 1 0
force -freeze sim:/decoder/selection 000 0
run
force -freeze sim:/decoder/selection 001 0
run
force -freeze sim:/decoder/selection 010 0
run
force -freeze sim:/decoder/selection 011 0
run
force -freeze sim:/decoder/selection 100 0
run
force -freeze sim:/decoder/selection 101 0
run
force -freeze sim:/decoder/selection 110 0
run
force -freeze sim:/decoder/selection 111 0
run