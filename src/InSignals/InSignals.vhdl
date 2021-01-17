library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity in_decoder is
port(
selections : in STD_LOGIC_VECTOR(2 downto 0);
out_in_decoder : out STD_LOGIC_VECTOR(4 downto 0)
);
end in_decoder;

architecture ain_decoder of in_decoder is
begin

PROCESS(selections)

BEGIN

IF(selections = "000") THEN
out_in_decoder <=  "00000" ;

ELSIF(selections = "001")THEN
out_in_decoder <=  "00001" ;

ELSIF(selections = "010")THEN
out_in_decoder <=  "00010" ;

ELSIF(selections = "011")THEN
out_in_decoder <=  "00100" ;

ELSIF(selections = "100")THEN
out_in_decoder <=  "01000" ;

ELSIF(selections = "101")THEN
out_in_decoder <=  "10000" ;

END IF;

END PROCESS;
end ain_decoder;
