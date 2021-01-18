LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux2 IS
	PORT (
	selectors: IN std_logic_vector(1 DOWNTO 0);
	twoOperandCode: IN std_logic_vector(3 DOWNTO 0);
	oneOperandCode: IN std_logic_vector(3 DOWNTO 0);
	output:OUT std_logic_vector(8 DOWNTO 0)
        );
END mux2;

ARCHITECTURE mux2Arch OF mux2 IS
BEGIN 
	output(8 DOWNTO 4) <= "01100" WHEN selectors = "10"
 	ELSE "10000" WHEN selectors = "01"
 	ELSE "00000"; 
	
  	output(3 DOWNTO 0) <= twoOperandCode WHEN selectors = "10"
 	ELSE oneOperandCode WHEN selectors = "01"
	ELSE "0000";

END mux2Arch;