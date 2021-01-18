
library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity In_out_Enabls is
port(
CW_IN_selectors : in STD_LOGIC_VECTOR(5 downto 0);
CW_OUT_selectors : in STD_LOGIC_VECTOR(3 downto 0);
Ir : in STD_LOGIC_VECTOR(15 downto 0);
IN_Enabals : out STD_LOGIC_VECTOR(14 downto 0);
OUT_Enabals : out STD_LOGIC_VECTOR(14 downto 0)
);
end In_out_Enabls;

architecture aIn_out_Enabls of In_out_Enabls is

COMPONENT Regester_Enabls 
  port(
   IN_selectors : in STD_LOGIC_VECTOR(2 downto 0);
   OUT_selectors : in STD_LOGIC_VECTOR(3 downto 0);
   IR : in STD_LOGIC_VECTOR(15 downto 0);
   IN_Enable : out STD_LOGIC_VECTOR(7 downto 0);
   out_Enable : out STD_LOGIC_VECTOR(7 downto 0)
    );
 END COMPONENT;

signal  inRegEnable,outRegEnable :  STD_LOGIC_VECTOR(7 downto 0);

begin

PROCESS(CW_IN_selectors,CW_OUT_selectors)

BEGIN

IF(CW_IN_selectors(2 downto 0) = "000") THEN
IN_Enabals(3 downto 0) <=  "0000" ;

ELSIF(CW_IN_selectors(2 downto 0) = "001")THEN
IN_Enabals(3 downto 0) <=  "1000" ;

ELSIF(CW_IN_selectors(2 downto 0) = "010")THEN
IN_Enabals(3 downto 0) <=  "0100" ;

ELSIF(CW_IN_selectors(2 downto 0) = "011")THEN
IN_Enabals(3 downto 0) <=  "0010" ;

ELSIF(CW_IN_selectors(2 downto 0) = "100")THEN
IN_Enabals(3 downto 0) <=  "0001" ;
END IF;

IF(CW_IN_selectors(5 downto 3) = "000") THEN
IN_Enabals(6 downto 4) <=  "000" ;

ELSIF(CW_IN_selectors(5 downto 3) = "011")THEN
IN_Enabals(6 downto 4) <=  "100" ;

ELSIF(CW_IN_selectors(5 downto 3) = "100")THEN
IN_Enabals(6 downto 4) <=  "010" ;

ELSIF(CW_IN_selectors(5 downto 3) = "101")THEN
IN_Enabals(6 downto 4) <=  "001" ;
ELSE
IN_Enabals(6 downto 4) <=  "000" ;
END IF;


IF(CW_OUT_selectors = "0000") THEN
OUT_Enabals(6 downto 0) <=  "0000000" ;

ELSIF(CW_OUT_selectors = "0011")THEN
OUT_Enabals(6 downto 0) <=  "1000000" ;

ELSIF(CW_OUT_selectors = "0100")THEN
OUT_Enabals(6 downto 0) <=  "0100000" ;

ELSIF(CW_OUT_selectors = "0101")THEN
OUT_Enabals(6 downto 0) <=  "0001000" ;

ELSIF(CW_OUT_selectors = "0110")THEN
OUT_Enabals(6 downto 0) <=  "0000100" ;

ELSIF(CW_OUT_selectors = "0111")THEN
OUT_Enabals(6 downto 0) <=  "0010000" ;

ELSIF(CW_OUT_selectors = "1000")THEN
OUT_Enabals(6 downto 0) <=  "0000010" ;

ELSIF(CW_OUT_selectors = "1001")THEN
OUT_Enabals(6 downto 0) <=  "0000001" ;
ELSE
OUT_Enabals(6 downto 0) <=  "0000000" ;

END IF;

END PROCESS;

Regenabls: Regester_Enabls PORT MAP(CW_IN_selectors(5 downto 3),CW_OUT_selectors,Ir,inRegEnable,outRegEnable);
IN_Enabals(14 downto 7)<=inRegEnable;
OUT_Enabals(14 downto 7)<=outRegEnable;

end aIn_out_Enabls;