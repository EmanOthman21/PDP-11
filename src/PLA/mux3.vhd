LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux3 IS
	PORT (
	selectors: IN std_logic;
	destMode: IN std_logic_vector(2 DOWNTO 0);
	output:OUT std_logic_vector(8 DOWNTO 0)
        );
END mux3;

ARCHITECTURE mux3Arch OF mux3 IS
BEGIN 
	output(8 DOWNTO 1) <= "11000000" WHEN selectors = '0'
 	ELSE "00000000"; 
	
  	output(0) <= destMode(2) or destMode(1) or destMode(0) WHEN selectors = '0'
	ELSE '0' ;

END mux3Arch;
