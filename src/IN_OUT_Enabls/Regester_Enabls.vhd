
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
  selection: in std_logic_vector(2 downto 0);
  ENABLEIN : in STD_LOGIC;
  ENABLEOUT : in STD_LOGIC;
  outEnable_decoder : out STD_LOGIC_VECTOR(7 downto 0);
  inEnable_decoder : out STD_LOGIC_VECTOR(7 downto 0)
   );
 END COMPONENT;

signal SrcOut,DestOut,SrcIn,DestIn:std_logic ;
signal IRscr,IRdest:std_logic_vector (2 downto 0);
signal outsourcedecoder,outdestdecoder,insourcedecoder,indestdecoder:std_logic_vector (7 downto 0);

begin
  SrcOut <= '1' when OUT_selectors = "0001"
  else '0';

  DestOut <= '1' when OUT_selectors = "0010"
  else '0';

  SrcIn <= '1' when IN_selectors = "001"
  else '0';

  DestIn <= '1' when IN_selectors = "010"
  else '0';

  IRscr <= IR(8 downto 6) when OUT_selectors = "0001" or IN_selectors = "001";
  IRdest <= IR(2 downto 0) when OUT_selectors = "0010" or IN_selectors = "010";

  -- Reg , IN/OUT , Enable register if in , Enable tristate if out
RegSourceEnable: decoder PORT MAP(IRscr,SrcIn,SrcOut,outsourcedecoder,insourcedecoder);
RegDestEnable: decoder PORT MAP(IRdest,DestIn,DestOut,outdestdecoder,indestdecoder);

IN_Enable<=insourcedecoder or indestdecoder ;
out_Enable<=outdestdecoder or outsourcedecoder;
end aRegester_Enabls;