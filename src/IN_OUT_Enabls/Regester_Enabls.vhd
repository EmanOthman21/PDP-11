
library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity Regester_Enabls is
port(
IN_selectors : in STD_LOGIC_VECTOR(2 downto 0);
OUT_selectors : in STD_LOGIC_VECTOR(3 downto 0);
IR : in STD_LOGIC_VECTOR(15 downto 0);
IN_Enable : out STD_LOGIC_VECTOR(7 downto 0);
out_Enable : out STD_LOGIC_VECTOR(7 downto 0)
);
end Regester_Enabls;

architecture aRegester_Enabls of Regester_Enabls is

 COMPONENT decoder 
  port(
  ENABLE1 : in STD_LOGIC;
  ENABLE2 : in STD_LOGIC;
  selection : in STD_LOGIC_VECTOR(2 downto 0);
  outEnable_decoder : out STD_LOGIC_VECTOR(7 downto 0);
  inEnable_decoder : out STD_LOGIC_VECTOR(7 downto 0)
   );
 END COMPONENT;

signal RegIn,RegOut:std_logic ;
signal IRscr,IRdest:std_logic_vector (2 downto 0);
signal outsourcedecoder,outdestdecoder,insourcedecoder,indestdecoder:std_logic_vector (7 downto 0);

begin

PROCESS(IN_selectors,OUT_selectors)
BEGIN

IF(OUT_selectors = "0001" or OUT_selectors = "0010" ) THEN
RegOut <=  '1' ;
ELSE
RegOut <=  '0' ;
END IF;

IF(IN_selectors = "001" or IN_selectors = "010") THEN
RegIn <=  '1' ;
ELSE
RegIn <=  '0' ;
END IF;

IF(OUT_selectors = "0001" or IN_selectors = "001" ) THEN
IRscr <= IR(8 downto 6);
END IF;

IF(OUT_selectors = "0010" or IN_selectors = "010" ) THEN
IRdest <= IR(2 downto 0);
END IF;


END PROCESS;

RegSourceDecoder: decoder PORT MAP(RegIn,RegOut ,IRscr, outsourcedecoder , insourcedecoder );
RegDestDecoder : decoder PORT MAP(RegIn,RegOut ,IRdest,outdestdecoder,indestdecoder);
IN_Enable<=insourcedecoder or indestdecoder ;
out_Enable<=outdestdecoder or outsourcedecoder;

end aRegester_Enabls;