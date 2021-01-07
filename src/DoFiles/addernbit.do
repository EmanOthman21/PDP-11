add wave -position insertpoint  \
sim:/addernbit/carry \
sim:/addernbit/cin \
sim:/addernbit/cout \
sim:/addernbit/n \
sim:/addernbit/s \
sim:/addernbit/x \
sim:/addernbit/y
force -freeze sim:/addernbit/x 16#0002 0
force -freeze sim:/addernbit/y 16#0002 0
force -freeze sim:/addernbit/cin 0 0
run
force -freeze sim:/addernbit/cin 1 0
run
force -freeze sim:/addernbit/y 0000000000000000 0
run
force -freeze sim:/addernbit/cin 0 0
force -freeze sim:/addernbit/x 16#18AB 0
force -freeze sim:/addernbit/y 16#4B78 0
run
force -freeze sim:/addernbit/x 16#98AB 0
run
force -freeze sim:/addernbit/cin 1 0
run
