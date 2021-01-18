LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux1 IS
	PORT (
	selectors: IN std_logic_vector(2 DOWNTO 0);
	srcMode: IN std_logic_vector(2 DOWNTO 0);
	destMode: IN std_logic_vector(2 DOWNTO 0);
	noOpCode: IN std_logic;
	output:OUT std_logic_vector(8 DOWNTO 0)
        );
END mux1;

ARCHITECTURE mux1Arch OF mux1 IS
BEGIN 
	output(8 DOWNTO 6) <= "101" WHEN selectors = "100"
 	ELSE "111" WHEN selectors = "001"
 	ELSE "010" WHEN selectors = "010"
 	ELSE "001" when selectors = "011"
 	ELSE "000"; 

  	output(5 DOWNTO 3) <= destMode WHEN selectors = "010"
 	ELSE srcMode WHEN selectors = "011"
	ELSE "000";

	output(2 DOWNTO 1) <= "00";

	output(0) <= noOpCode WHEN selectors = "001"
	ELSE '0';
END mux1Arch;
