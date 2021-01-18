library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity decoder is
port(
ENABLE1 : in STD_LOGIC;
ENABLE2 : in STD_LOGIC;
selection : in STD_LOGIC_VECTOR(2 downto 0);
outEnable_decoder : out STD_LOGIC_VECTOR(7 downto 0);
inEnable_decoder : out STD_LOGIC_VECTOR(7 downto 0)
);
end decoder;

architecture adecoder of decoder is
begin

PROCESS(ENABLE1,ENABLE2,selection)

BEGIN

outEnable_decoder<="00000000";
inEnable_decoder<="00000000";

IF(ENABLE1 = '0' and  ENABLE2 = '1' ) THEN
	IF(selection = "000") THEN
	outEnable_decoder <=  "10000000" ;

	ELSIF(selection = "001")THEN
	outEnable_decoder <=  "01000000" ;

	ELSIF(selection = "010")THEN
	outEnable_decoder <=  "00100000" ;

	ELSIF(selection = "011")THEN
	outEnable_decoder <=  "00010000" ;

	ELSIF(selection = "100")THEN
	outEnable_decoder<=  "00001000" ;

	ELSIF(selection = "101")THEN
	outEnable_decoder <=  "00000100" ;

	ELSIF(selection = "110")THEN
	outEnable_decoder <=  "00000010" ;

	ELSIF(selection = "111")THEN
	outEnable_decoder  <=  "00000001" ;
	END IF;

ELSE IF(ENABLE1 = '1' and  ENABLE2 = '0')THEN

	IF(selection = "000") THEN
	inEnable_decoder <=  "10000000" ;

	ELSIF(selection = "001")THEN
	inEnable_decoder <=  "01000000" ;

	ELSIF(selection = "010")THEN
	inEnable_decoder <=  "00100000" ;

	ELSIF(selection = "011")THEN
	inEnable_decoder <=  "00010000" ;

	ELSIF(selection = "100")THEN
	inEnable_decoder<=  "00001000" ;

	ELSIF(selection = "101")THEN
	inEnable_decoder <=  "00000100" ;

	ELSIF(selection = "110")THEN
	inEnable_decoder <=  "00000010" ;

	ELSIF(selection = "111")THEN
	inEnable_decoder <=  "00000001" ;

	END IF;
END IF;
END IF;
END PROCESS;
end adecoder;