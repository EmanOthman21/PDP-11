Library ieee;
use ieee.std_logic_1164.all;

ENTITY alu IS
Generic ( n : Integer:=16);
  PORT (A,B : IN std_logic_vector (n-1 downto 0);
  selector : IN std_logic_vector (4 downto 0);
	cin: IN std_logic;
	F: OUT std_logic_vector (n-1 downto 0);
	cout : OUT std_logic);
END alu;

ARCHITECTURE a_alu OF alu IS
  component addernbit is
    PORT (x,y : IN   std_logic_vector (n-1 downto 0);
    cin: IN std_logic;
    s: OUT std_logic_vector (n-1 downto 0);
    cout : OUT std_logic);
  END component;

  -- Define signals
  Signal FADD, FADC, FSUB, FSBC : std_logic_vector(n-1 DOWNTO 0);
  Signal FAND, FFOR, FXOR, FCMP : std_logic_vector(n-1 DOWNTO 0);
  Signal FINC, FDEC, FCLR, FINV : std_logic_vector(n-1 DOWNTO 0);
  Signal FLSR, FROR, FASR : std_logic_vector(n-1 DOWNTO 0);

  Signal CADD, CADC, CSUB, CSBC : std_logic;
  Signal CAND, CFOR, CXOR, CCMP : std_logic;
  Signal CINC, CDEC, CCLR, CINV : std_logic;
  Signal CLSR, CROR, CASR : std_logic;

  BEGIN

  -- logic
  ADDER: addernbit PORT MAP(A, B, '0', FADD, CADD);
  ADDERCARRAY: addernbit PORT MAP(A, B, CIN, FADC, CADC);
  SUBBTRACTOR: addernbit PORT MAP(A, "not" B, '1', FSUB, CSUB);
  SUBBCARRY: addernbit PORT MAP(A, "not" B, '0', FSBC, CSBC);

  -- map outputs
    F <= A when selector = '00001'
    else FADD when selector = '00010'
    else FADC when selector = '00011'
    else FSUB when selector = '00100' or (selector = '00101' and cin = '0')
    else FSBC when selector = '00101' and cin = '1'
    else (A and B) when selector = '00110'
    else (A or B) when selector = '00111'
    else (A xor B) when selector = '01000'

    cout <= cin when selector = '00001'
    else CADD when selector = '00010'
    else CADC when selector = '00011'
    else CSUB when selector = '00100' or (selector = '00101' and cin = '0')
    else CSBC when selector = '00101' and cin = '1'
    else '0' when selector = '00110' or selector = '00111' or selector = '01000'
END a_alu;