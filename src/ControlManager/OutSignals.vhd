library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity out_decoder is
port(
out_selections : in STD_LOGIC_VECTOR(3 downto 0);
out_out_decoder : out STD_LOGIC_VECTOR(8 downto 0)
);
end out_decoder;

architecture aout_decoder of out_decoder is
begin

PROCESS(out_selections)

BEGIN

IF(out_selections = "0000") THEN
out_out_decoder <=  "000000000" ;

ELSIF(out_selections = "0001")THEN
out_out_decoder <=  "000000001" ;

ELSIF(out_selections = "0010")THEN
out_out_decoder <=  "000000010" ;

ELSIF(out_selections = "0011")THEN
out_out_decoder <=  "000000100" ;

ELSIF(out_selections = "0100")THEN
out_out_decoder <=  "000001000" ;

ELSIF(out_selections = "0101")THEN
out_out_decoder <=  "000010000" ;

ELSIF(out_selections = "0110")THEN
out_out_decoder <=  "000100000" ;

ELSIF(out_selections = "0111")THEN
out_out_decoder <=  "001000000" ;

ELSIF(out_selections = "1000")THEN
out_out_decoder <=  "010000000" ;

ELSIF(out_selections = "1001")THEN
out_out_decoder <=  "100000000" ;

END IF;

END PROCESS;
end aout_decoder;
