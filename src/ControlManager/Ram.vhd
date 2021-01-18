LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY ram_Entity IS
GENERIC (
n : integer := 16
);
	PORT(
		rst:IN std_logic;
		clk : IN std_logic;
		MAR : IN  std_logic_vector(15 DOWNTO 0);
		DATAIN : IN  std_logic_vector(n-1 DOWNTO 0);
		ReadWriteSignals:IN std_logic_vector(1 DOWNTO 0);
		DATAOUT : OUT  std_logic_vector(n-1 DOWNTO 0)
);

END ram_Entity;

ARCHITECTURE RAM_Memory OF ram_Entity IS

	TYPE ram_type IS ARRAY(0 TO 1999) OF std_logic_vector(n-1 DOWNTO 0);
	SIGNAL ram : ram_type ;
	BEGIN
		
				
	ram(to_integer(unsigned(MAR))) <= DATAIN WHEN ReadWriteSignals = "10"  ;
					
	DATAOUT <= ram(to_integer(unsigned(MAR))) when ReadWriteSignals = "01" ;
			
		
END RAM_Memory;
