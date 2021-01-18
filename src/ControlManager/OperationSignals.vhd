Library ieee;
use ieee.std_logic_1164.all;

ENTITY OperationSignals IS
  PORT (IR : IN std_logic_vector (15 downto 0);
  CodeWord : IN std_logic_vector (25 downto 0);
  OperationType : OUT std_logic_vector (3 downto 0);
  ALUSelector: OUT std_logic_vector (4 downto 0));
END OperationSignals;

ARCHITECTURE opsignals OF OperationSignals IS

  -- Define signals
  Signal D, C, B, A, NOTB, NOTA : std_logic;
  BEGIN

  -- logic
  D <= IR(15);
  C <= IR(14);
  B <= IR(13);
  A <= IR(12);
  NOTB <= not B;
  NOTA <= not A;

  -- map outputs
  OperationType(3) <= not( D and C);
  OperationType(2) <= (D and C) and (NOTB and A);
  OperationType(1) <= (D and C) and B;
  OperationType(0) <= (D and C) and (NOTB and NOTA);

  ALUSelector <= CodeWord(15 downto 11);
END opsignals;