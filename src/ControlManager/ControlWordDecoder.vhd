
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY ControlWord_Entity IS
GENERIC (
n : integer := 26
);
	PORT(
		uPC : INOUT std_logic_vector(8 DOWNTO 0);
		ControlWord : IN std_logic_vector(n-1 DOWNTO 0);
		HLT : OUT std_logic;
		RST : OUT std_logic);
END ENTITY ControlWord_Entity;

ARCHITECTURE ControlWordDecoder OF ControlWord_Entity IS

COMPONENT alu IS
Generic ( n : Integer:=16);
  	PORT (A,B : IN std_logic_vector (n-1 downto 0);
  	selector : IN std_logic_vector (4 downto 0);
	cin: IN std_logic;
	F: OUT std_logic_vector (n-1 downto 0);
	cout : OUT std_logic);
END COMPONENT;

	-- Registers Signals -- 

	Signal MDR : std_logic_vector(15 DOWNTO 0);
	Signal MAR : std_logic_vector(15 DOWNTO 0);
	Signal Rsrc : std_logic_vector(15 DOWNTO 0);
	Signal Rdst : std_logic_vector(15 DOWNTO 0);
	Signal PC : std_logic_vector(15 DOWNTO 0);
	Signal IR : std_logic_vector(15 DOWNTO 0);
	Signal X : std_logic_vector(15 DOWNTO 0);
	Signal Y : std_logic_vector(15 DOWNTO 0);
	Signal Z : std_logic_vector(15 DOWNTO 0);
	Signal FlagRegister : std_logic_vector(15 DOWNTO 0);

	-- 0 Bit For Branch , 1 Bit For 1 operand , 2 Bit for 2 operands ,3 Bit for 0 Operand , EX: 0001 means Branch Operation --
	Signal OperationType : std_logic_vector(3 DOWNTO 0);

	-- Processor Data Bus --
	Signal DataBus : std_logic_vector(15 DOWNTO 0);


	BEGIN
	-- Registers Decoders SHOULD BE CALLED HERE For In\OUT And Out the results to the Registers Signals , Should be Called For All Registers AND OUT TO THE DATABUS --
	
	-- ALU SHOULD TAKE LAST 3 BITS FROM uPC TO CHECK IF CHANGE FLAG REG CARRY OR NOT --
	ALUComponent : alu GENERIC MAP (16) port map (X,Y,ControlWord(15 downto 11),FlagRegister(0),Z,FlagRegister(0));

	-- 0 OP HANDLER ENTITY SHOULD BE CALLED HERE AND TAKES CW BITS (10 DWONTO 9) AND OUT TO HLT/RST --

	-- OPERATION TYPE HANDLER (0-1-2-BRANCH) SHOULD BE CALLED HERE AND OUT To The OperationType Vector  --

	-- PLA SHOULD BE CALLED HERE AND TAKES CW (3 DOWNTO 1) BITS -F9- AND OPERATION TYPE VECTOR ,IR VECTOR SIGNAL ,CW (0) PLA BIT TO CHECK IF CHANGE uPC OR NOT THEN OUT TO THE uPC --

	-- SET/CLEAR CARRY AND Y REG SHOULD BE CALLED HERE AND TAKES CW (5 DOWNTO) AND OUT TO THE Y SIGNAL AND FLAG REG(0) --

	-- RAM SHOULD BE CALLED HERE AND TAKES CW (8 DOWNTO 7) FOR READWRITE , CW(6) FOR WFMC , MAR(10 DOWNTO 0) ,MDR THEN OUT TO THE MAR,MDR -WFMC NEEDS TO HANDLED HERE- --
END ControlWordDecoder;