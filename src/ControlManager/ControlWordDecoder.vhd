
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
		clk : IN std_logic;
		RESET:IN std_logic);
END ENTITY ControlWord_Entity;

ARCHITECTURE ControlWordDecoder OF ControlWord_Entity IS

COMPONENT tristate IS
Generic ( n : Integer:=16);
	PORT (en : IN  std_logic;
	  intri: IN	std_logic_vector(n-1 DOWNTO 0);
    outtri : OUT std_logic_vector(n-1 DOWNTO 0));
END COMPONENT;

COMPONENT Reg IS
Generic ( n : Integer:=16);
    PORT( clk,rst,enable : IN std_logic;
	    d: IN std_logic_vector(n-1 DOWNTO 0);
      q : OUT std_logic_vector(n-1 DOWNTO 0));
END COMPONENT;

COMPONENT In_out_Enabls is
port(
CW_IN_selectors : in STD_LOGIC_VECTOR(5 downto 0);
CW_OUT_selectors : in STD_LOGIC_VECTOR(3 downto 0);
Ir : in STD_LOGIC_VECTOR(15 downto 0);
IN_Enabals : out STD_LOGIC_VECTOR(14 downto 0);
OUT_Enabals : out STD_LOGIC_VECTOR(14 downto 0)
);
end COMPONENT;

component ram_Entity IS
GENERIC (
n : integer := 16
);
	PORT(
		rst:IN std_logic;
		clk : IN std_logic;
		MAR : IN  std_logic_vector(15 DOWNTO 0);
		DATAIN : IN  std_logic_vector(n-1 DOWNTO 0);
		ReadWriteSignals:IN std_logic_vector(1 DOWNTO 0);
		DATAOUT : OUT  std_logic_vector(n-1 DOWNTO 0));
END component;

component PLA IS
	PORT (
	operationType: IN std_logic_vector(3 DOWNTO 0);
	IR: IN std_logic_vector(15 DOWNTO 0);
	F9: IN std_logic_vector(2 DOWNTO 0);
	branchCheck: IN std_logic;
	plaOut: OUT std_logic_vector(8 DOWNTO 0);
	isHLT:IN std_logic
	
        );
END component;

COMPONENT branchFlag IS
	PORT (
	isBranch: IN std_logic;
	branchCode: IN std_logic_vector(2 DOWNTO 0);
	flags: IN std_logic_vector(1 DOWNTO 0);
	FlagOut:OUT std_logic
        );
END COMPONENT;

COMPONENT OperationSignals IS
  PORT (IR : IN std_logic_vector (15 downto 0);
  CodeWord : IN std_logic_vector (25 downto 0);
  OperationType : OUT std_logic_vector (3 downto 0);
  ALUSelector: OUT std_logic_vector (4 downto 0));
END COMPONENT;

COMPONENT alu IS
Generic ( n : Integer:=16);
  PORT (A,B : IN std_logic_vector (n-1 downto 0);
  selector : IN std_logic_vector (4 downto 0);
	cin: IN std_logic;
	F: OUT std_logic_vector (n-1 downto 0);
	cout : OUT std_logic);
END COMPONENT;

COMPONENT flag IS
  PORT ( cin, changeEnable: IN std_logic;
  inFlag: IN std_logic_vector (2 downto 0);
  F: IN std_logic_vector(15 downto 0);
	outFlag: OUT std_logic_vector (2 downto 0));
END COMPONENT;

	-- Registers Signals -- 

	Signal MDR : std_logic_vector(15 DOWNTO 0);
	Signal MAR : std_logic_vector(15 DOWNTO 0);
	Signal R0 : std_logic_vector(15 DOWNTO 0);
	Signal R1 : std_logic_vector(15 DOWNTO 0);
	Signal R2 : std_logic_vector(15 DOWNTO 0);
	Signal R3 : std_logic_vector(15 DOWNTO 0);
	Signal R4 : std_logic_vector(15 DOWNTO 0);
	Signal R5 : std_logic_vector(15 DOWNTO 0);
	Signal R6 : std_logic_vector(15 DOWNTO 0);
	Signal R7 : std_logic_vector(15 DOWNTO 0);
	Signal PC : std_logic_vector(15 DOWNTO 0);
	Signal IR : std_logic_vector(15 DOWNTO 0);
	Signal X : std_logic_vector(15 DOWNTO 0);
	Signal Y : std_logic_vector(15 DOWNTO 0);
	Signal Z : std_logic_vector(15 DOWNTO 0);
	Signal DataBus : std_logic_vector(15 DOWNTO 0);
	SIGNAL ENABLEIN:std_logic_vector(14 DOWNTO 0);		
	SIGNAL ENABLEOUT:std_logic_vector(14 DOWNTO 0);
	SIGNAL RAMCLK:std_logic;
	Signal FlagRegister : std_logic_vector(2 DOWNTO 0);
	Signal OperationType : std_logic_vector(3 DOWNTO 0);
	Signal ALUselector : std_logic_vector(4 DOWNTO 0);
	Signal FlagOut:std_logic;
	Signal Carry:std_logic;
	Signal ALUOUT: std_logic_vector(15 DOWNTO 0);
	Signal changeFlagEnable:std_logic;
	Signal IROUT :std_logic_vector(15 DOWNTO 0);
	Signal rst : std_logic;
	Signal Xin : std_logic_vector(15 DOWNTO 0);
	Signal Yin : std_logic_vector(15 DOWNTO 0);
	Signal Carry_IN : std_logic;
	Signal PLAOUT:std_logic_vector(8 DOWNTO 0);
	Signal RAMIN :std_logic_vector(15 DOWNTO 0);
	Signal RAMOUT:std_logic_vector(15 DOWNTO 0);
	Signal CLKREG:std_logic;
	Signal PCEnableOUT:std_logic;
	Signal PCEnableIN:std_logic;
	Signal resetRegisters:std_logic;
	Signal ChangeFlagTmp1:std_logic;
	Signal ChangeFlagTmp2:std_logic;
	-- Processor Data Bus --
	


	BEGIN
CLKREG<= not clk;
	-- Registers Decoders SHOULD BE CALLED HERE For In\OUT And Out the results to the Registers Signals , Should be Called For All Registers AND OUT TO THE DATABUS --
	EnableRegistersComponent: In_out_Enabls port map (ControlWord(21 DOWNTO 16),ControlWord(25 DOWNTO 22),IR,ENABLEIN,ENABLEOUT);
rst<=ControlWord(9);
PCEnableOUT<= ENABLEOUT(7) OR ENABLEOUT(6);
PCEnableIN<=ENABLEIN(7) OR ENABLEIN(6);
TRISTATR0:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(14),R0,DataBus);
TRISTATR1:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(13),R1,DataBus);
TRISTATR2:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(12),R2,DataBus);
TRISTATR3:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(11),R3,DataBus);
TRISTATR4:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(10),R4,DataBus);
TRISTATR5:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(9),R5,DataBus);
TRISTATR6:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(8),R6,DataBus);
TRISTATMAR:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(0),MAR,DataBus);
TRISTATMDR:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(1),MDR,DataBus);
TRISTATX:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(3),X,DataBus);
TRISTATY:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(2),Y,DataBus);
TRISTATZ:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(4),Z,DataBus);
IROUT<="00000000"&IR(7 DOWNTO 0);
TRISTATIR:tristate GENERIC MAP (16) PORT MAP(ENABLEOUT(5),IROUT,DataBus);
TRISTATPC:tristate GENERIC MAP (16) PORT MAP(PCEnableOUT,PC,DataBus);

resetRegisters<=rst or RESET;

register0:Reg GENERIC MAP (16) PORT MAP(CLKREG,resetRegisters,ENABLEIN(14),DataBus,R0);
register1:Reg GENERIC MAP (16) PORT MAP(CLKREG,resetRegisters,ENABLEIN(13),DataBus,R1);
register2:Reg GENERIC MAP (16) PORT MAP(CLKREG,resetRegisters,ENABLEIN(12),DataBus,R2);
register3:Reg GENERIC MAP (16) PORT MAP(CLKREG,resetRegisters,ENABLEIN(11),DataBus,R3);
register4:Reg GENERIC MAP (16) PORT MAP(CLKREG,resetRegisters,ENABLEIN(10),DataBus,R4);
register5:Reg GENERIC MAP (16) PORT MAP(CLKREG,resetRegisters,ENABLEIN(9),DataBus,R5);
register6:Reg GENERIC MAP (16) PORT MAP(CLKREG,resetRegisters,ENABLEIN(8),DataBus,R6);
registerMAR:Reg GENERIC MAP (16) PORT MAP(CLKREG,rst,ENABLEIN(0),DataBus,MAR);
registerMDR:Reg GENERIC MAP (16) PORT MAP(CLKREG,rst,ENABLEIN(1),DataBus,RAMIN);
registerX:Reg GENERIC MAP (16) PORT MAP(CLKREG,rst,ENABLEIN(3),DataBus,X);
registerY:Reg GENERIC MAP (16) PORT MAP(CLKREG,rst,ENABLEIN(2),DataBus,Y);
registerZ:Reg GENERIC MAP (16) PORT MAP(CLKREG,rst,ENABLEIN(4),ALUOUT,Z);
registerIR:Reg GENERIC MAP (16) PORT MAP(CLKREG,rst,ENABLEIN(5),DataBus,IR);
registerPC:Reg GENERIC MAP (16) PORT MAP(CLKREG,resetRegisters,PCEnableIN,DataBus,PC);



	-- Operation Type Handler	
	OperationSignalsComponent: OperationSignals port map (IR,ControlWord,OperationType,ALUselector);

	-- Branch Flag Test Handler
	branchFlagComponent: branchFlag port map (OperationType(0),IR(11 DOWNTO 9),FlagRegister(2 DOWNTO 1),FlagOut);

	
	-- ALU -- MSB:CARRY-ZERO-NEG -ALUOUT SHOULB BE DATA FOR Z_IN
	Xin <= DataBus WHEN ControlWord(0) ='1'
	ELSE X;
	Yin <= "0000000000000000" WHEN ControlWord(5) ='1'
	ELSE Y;
	Carry_IN <= '1' WHEN ControlWord(5) ='1'
	ELSE FlagRegister(2);
	ALUComponent : alu GENERIC MAP (16) port map (Xin,Yin,ALUselector,Carry_IN,ALUOUT,Carry);

	-- Flag Change
	 ChangeFlagTmp1<=not uPC(8) and uPC(7) and uPC(6)  ;
	ChangeFlagTmp2<= uPC(8) and not uPC(7) and not uPC(6);
	changeFlagEnable <= ChangeFlagTmp1 or ChangeFlagTmp2;
	FLAGComponent:flag port map (Carry,changeFlagEnable,FlagRegister,ALUOUT,FlagRegister);

	--PLA NEEDS MODIFICATION FOR uPC INC
	PLAComponent:PLA port map (OperationType,IR,ControlWord(4 downto 2),FlagOut,PLAOUT, ControlWord(10));
	PROCESS(clk) IS  
		BEGIN
    		IF rising_edge(clk) THEN  
			IF  ControlWord(1)='1' AND ControlWord(10)='0' THEN
				uPC <= PLAOUT;
			END IF;
			IF ControlWord(1)='0' AND ControlWord(10)='0' THEN
          			uPC <= std_logic_vector( unsigned(uPC) + 1 );
			END IF;
    		END IF;
	END PROCESS;
	-- RAM 
	
	RAMCLK<=not clk;
	RAMComponent : ram_Entity GENERIC MAP (16) port map (rst,RAMCLK,MAR,RAMIN,ControlWord(8 downto 7),RAMOUT);
	MDR <= RAMOUT WHEN ControlWord(8 DOWNTO 7) ="01"
	ELSE RAMIN WHEN ControlWord(8 DOWNTO 7) ="10";
END ControlWordDecoder;