library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity decoder is
port(
ENABLE : in STD_LOGIC;
selection : in STD_LOGIC_VECTOR(2 downto 0);
out_decoder : out STD_LOGIC_VECTOR(7 downto 0)
);
end decoder;

architecture adecoder of decoder is
begin

PROCESS(ENABLE,selection)

BEGIN

IF(ENABLE = '0') THEN

out_decoder <=  "00000000" ;

Else

IF(selection = "000") THEN
out_decoder <=  "00000001" ;

ELSIF(selection = "001")THEN
out_decoder <=  "00000010" ;

ELSIF(selection = "010")THEN
out_decoder <=  "00000100" ;

ELSIF(selection = "011")THEN
out_decoder <=  "00001000" ;

ELSIF(selection = "100")THEN
out_decoder <=  "00010000" ;

ELSIF(selection = "101")THEN
out_decoder <=  "00100000" ;

ELSIF(selection = "110")THEN
out_decoder <=  "01000000" ;

ELSIF(selection = "111")THEN
out_decoder <=  "10000000" ;

END IF;

END IF;

END PROCESS;
end adecoder;