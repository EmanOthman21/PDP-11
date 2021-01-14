vsim work.branchflag

add wave -position insertpoint  \
sim:/branchflag/isBranch \
sim:/branchflag/branchCode \
sim:/branchflag/flags \
sim:/branchflag/FlagOut
force -freeze sim:/branchflag/isBranch 0 0
force -freeze sim:/branchflag/branchCode 3'h1 0
force -freeze sim:/branchflag/flags 2'h1 0
run
force -freeze sim:/branchflag/flags 2'h0 0
run
force -freeze sim:/branchflag/isBranch 1 0
run
force -freeze sim:/branchflag/flags 2'h1 0
run
force -freeze sim:/branchflag/branchCode 3'h0 0
run
force -freeze sim:/branchflag/branchCode 3'h2 0
run
run
force -freeze sim:/branchflag/flags 2'h0 0
run
force -freeze sim:/branchflag/flags 2'h3 0
run -continue
run
force -freeze sim:/branchflag/branchCode 3'h4 0
run
force -freeze sim:/branchflag/branchCode 3'h5 0
run
force -freeze sim:/branchflag/flags 2'h0 0
run

