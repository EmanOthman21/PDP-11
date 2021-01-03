LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY tristate IS
Generic ( n : Integer:=16);
	PORT (en : IN  std_logic;
	  intri: IN	std_logic_vector(n-1 DOWNTO 0);
    outtri : OUT std_logic_vector(n-1 DOWNTO 0));
END tristate;

ARCHITECTURE triArch OF tristate is
	BEGIN
  	outtri <= intri when en = '1'
   	else	(others => 'Z');
END triArch;