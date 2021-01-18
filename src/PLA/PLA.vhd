LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PLA IS
	PORT (
	operationType: IN std_logic_vector(3 DOWNTO 0);
	IR: IN std_logic_vector(15 DOWNTO 0);
	F9: IN std_logic_vector(2 DOWNTO 0);
	branchCheck: IN std_logic;
	plaOut: OUT std_logic_vector(8 DOWNTO 0);
	isHLT:IN std_logic
        );
END PLA;

ARCHITECTURE plaArch OF PLA IS
	COMPONENT mux1 is 
	PORT (
	selectors: IN std_logic_vector(2 DOWNTO 0);
	srcMode: IN std_logic_vector(2 DOWNTO 0);
	destMode: IN std_logic_vector(2 DOWNTO 0);
	noOpCode: IN std_logic;
	output:OUT std_logic_vector(8 DOWNTO 0));
 	END COMPONENT;

	COMPONENT mux2 is 
 	PORT (
	selectors: IN std_logic_vector(1 DOWNTO 0);
	twoOperandCode: IN std_logic_vector(3 DOWNTO 0);
	oneOperandCode: IN std_logic_vector(3 DOWNTO 0);
	output:OUT std_logic_vector(8 DOWNTO 0));
 	END COMPONENT;

	COMPONENT mux3 is 
 	PORT (
	selectors: IN std_logic;
	destMode: IN std_logic_vector(2 DOWNTO 0);
	output:OUT std_logic_vector(8 DOWNTO 0));
 	END COMPONENT;

	COMPONENT encoder is 
 	PORT (
	input: IN  std_logic_vector(3 DOWNTO 0);
	output:OUT std_logic_vector(1 DOWNTO 0));
 	END COMPONENT;

	--output of each mux
	SIGNAL out1,out2,out3,out4:std_logic_vector (8 DOWNTO 0);
	SIGNAL mux1Selectors:std_logic_vector (2 DOWNTO 0);
	SIGNAL encoderOut:std_logic_vector (1 DOWNTO 0);
	SIGNAL isCmp:std_logic;

BEGIN
	m1: mux1 PORT MAP (mux1Selectors,IR(11 DOWNTO 9),IR(5 DOWNTO 3),IR(12),out1);
	m2: mux2 PORT MAP (operationType(3 DOWNTO 2),IR(15 DOWNTO 12),IR(11 DOWNTO 8),out3);
	m3: mux3 PORT MAP (isCmp,IR(5 DOWNTO 3),out4);

	e3: encoder PORT MAP (operationType,encoderOut);

	isCmp <= IR(15) and not IR(14) and not IR(13) and not IR(12);

	mux1Selectors(1 DOWNTO 0) <= encoderOut;
	mux1Selectors(2) <= branchCheck;
 	
	out2(8 DOWNTO 6) <= "010";
	out2(5 DOWNTO 3) <= IR(5 DOWNTO 3);
	out2(2 DOWNTO 0) <= "000";

	--finish fetch operation
	plaOut <= out1 WHEN F9 = "000"
	--finish fetch source GO to destination
 	ELSE out2 WHEN F9 = "001"
	--finish fetch destination GO to ALU
 	ELSE out3 WHEN F9 = "010" 
	--finish ALU write result 
	ELSE out4 WHEN F9 = "011"
	--if HLT then stay there
	ELSE "000000000" WHEN isHLT='0';
	

END plaArch;
