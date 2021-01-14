LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY ControlManager_Entity IS
GENERIC (
n : integer := 26
);
	PORT(
		clk : IN std_logic);
END ENTITY ControlManager_Entity;

ARCHITECTURE ControlManager OF ControlManager_Entity IS
Component ControlWord_Entity IS
GENERIC (
n : integer := 26
);
	PORT(
		uPC : INOUT std_logic_vector(8 DOWNTO 0);
		ControlWord : IN std_logic_vector(n-1 DOWNTO 0);
		HLT : OUT std_logic;
		RST : OUT std_logic);
END Component ControlWord_Entity;
	Signal uPC : std_logic_vector(n-1 DOWNTO 0):= (OTHERS => '0') ;
	Signal ControlWord : std_logic_vector(n-1 DOWNTO 0);
	Signal HLT : std_logic;
	Signal RST : std_logic;
	BEGIN
		PROCESS(clk,HLT,RST) IS
			BEGIN
				IF HLT = '1' or RST = '1' THEN
					uPC <= (OTHERS => '0');
				END IF;
				IF HLT = '0' and rising_edge(clk) THEN  
					--ROM SHOULD BE CALLED HERE IT TAKES uPC AND OUT TO THE ControlWord VectorSignal
					--ControlWordDecoder Should BE CALLED HERE AND Takes ControlWord Signal And uPC and out to the uPC,HLT,RST
				END IF;
		END PROCESS;
		
END ControlManager;