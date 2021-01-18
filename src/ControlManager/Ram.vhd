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
		MAR : INOUT  std_logic_vector(10 DOWNTO 0);
		MDR : INOUT  std_logic_vector(n-1 DOWNTO 0);
		ReadWriteSignals:IN std_logic_vector(1 DOWNTO 0));
END ENTITY ram_Entity;

ARCHITECTURE RAM_Memory OF ram_Entity IS

	TYPE ram_type IS ARRAY(0 TO 1999) OF std_logic_vector(n-1 DOWNTO 0);
	SIGNAL ram : ram_type ;
	BEGIN
		PROCESS(clk) IS
			BEGIN
				IF rst='1' THEN
					ram <= (
					OTHERS => "0000000000000000"
					);
				END IF;
				IF rising_edge(clk) THEN  
					IF ReadWriteSignals = "10" THEN
						ram(to_integer(unsigned(MAR))) <= MDR;
					END IF;
					IF ReadWriteSignals = "01" THEN 
						MDR <= ram(to_integer(unsigned(MAR)));
					END IF;
				END IF;
		END PROCESS;
		
END RAM_Memory;
