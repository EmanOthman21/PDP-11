LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
ENTITY Reg IS
Generic ( n : Integer:=16);
    PORT( clk,rst,enable : IN std_logic;
	    d: IN std_logic_vector(n-1 DOWNTO 0);
      q : OUT std_logic_vector(n-1 DOWNTO 0));
END Reg;

ARCHITECTURE a_Reg OF Reg IS
  BEGIN
    PROCESS(clk,rst)
      BEGIN
      IF (enable = '0') THEN null;
      ELSIF(rst = '1') THEN
        q <= (others => '0');
      ELSIF  clk'event and clk = '1'  THEN
        q <= d;
      END IF;
    END PROCESS;
END a_Reg;