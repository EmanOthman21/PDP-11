LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY branchFlag IS
	PORT (
	isBranch: IN std_logic;
	branchCode: IN std_logic_vector(2 DOWNTO 0);
	flags: IN std_logic_vector(1 DOWNTO 0);
	FlagOut:OUT std_logic
        );
END branchFlag;

ARCHITECTURE branchFlagArch OF branchFlag IS
	SIGNAL carryOrZero:std_logic;
BEGIN 
	carryOrZero <= flags(0) or flags(1);


	--BEQ
	FlagOut <= flags(0) and isBranch WHEN branchCode = "001"
	--BNE
	ELSE not flags(0) and isBranch WHEN branchCode = "010"
	--BLO
	ELSE flags(1) and isBranch WHEN branchCode = "011"
	--BHS
	ELSE not flags(1) and isBranch WHEN branchCode = "110"
	--BLS
	ELSE carryOrZero and isBranch WHEN branchCode = "100"
	--BHI
	ELSE not carryOrZero and isBranch WHEN branchCode = "101"
	--BR if this is a branch instruction then it is an unconditional one
 	ELSE isBranch;
	

END branchFlagArch;
