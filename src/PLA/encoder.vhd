LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY encoder IS
	PORT (
	input: IN  std_logic_vector(3 DOWNTO 0);
	output:OUT std_logic_vector(1 DOWNTO 0)
        );
END encoder;

ARCHITECTURE encoderArch OF encoder IS
BEGIN 
	output(0) <= input(1) or input(3);
	output(1) <= input(2) or input(3);
END encoderArch;