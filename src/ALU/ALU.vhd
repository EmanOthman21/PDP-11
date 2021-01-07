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
  Signal FINC, FDEC, FCMP, FINV : std_logic_vector(n-1 DOWNTO 0);
  Signal FINVA, NEGB, NEGA, ONE : std_logic_vector(n-1 DOWNTO 0);
  Signal NEGBMIN : std_logic_vector(n-1 DOWNTO 0);

  Signal CADD, CADC, CSUB, CSBC , CA: std_logic;
  Signal CINC, CDEC, CINV, CCMP, CB , CNEGB : std_logic;

  BEGIN

  -- logic
  FINV <= not B;
  FINVA <= not A;
  ONE <= "0000000000000001";
  NegBAdder : addernbit GENERIC MAP (16) port map (FINV, ONE, '0', NEGB, CB);
  NegAAdder : addernbit GENERIC MAP (16) port map (FINVA, ONE, '0', NEGA, CA);

  -- A + B
  ADDER: addernbit GENERIC MAP (16) PORT MAP(A, B, '0', FADD, CADD);
  -- A + B + carry
  ADDERCARRY: addernbit GENERIC MAP (16) PORT MAP(A, B, CIN, FADC, CADC);
  -- A - B = A + (-B)
  SUBBTRACTOR: addernbit GENERIC MAP (16) PORT MAP(A, NEGB, '0', FSUB, CSUB);
  -- -B - 1
  DECNEGB: addernbit GENERIC MAP (16) PORT MAP(NEGB, (others => '1'), '0', NEGBMIN, CNEGB);
  -- A - B -1 = A + (-B - 1)
  SUBBCARRY: addernbit GENERIC MAP (16) PORT MAP(A, NEGBMIN, '0', FSBC, CSBC);
  -- B - A = B + (-A)
  COMPARATOR: addernbit GENERIC MAP (16) PORT MAP(B, NEGA, '0', FCMP, CCMP);
  -- B + 1
  INCREMENTOR: addernbit GENERIC MAP (16) PORT MAP(B, (others => '0'), '1', FINC, CINC);
  -- B - 1 = B + (-1)
  DECREMENTOR: addernbit GENERIC MAP (16) PORT MAP(B, (others => '1'), '0', FDEC, CDEC);

  -- map outputs
    F <= A when selector = "00001"
    else FADD when selector = "00010"
    else FADC when selector = "00011"
    else FSUB when selector = "00100" or (selector = "00101" and cin = '0')
    else FSBC when selector = "00101" and cin = '1'
    else (A and B) when selector = "00110"
    else (A or B) when selector = "00111"
    else (A xor B) when selector = "01000"
    else FCMP when selector = "01001"
    else FINC when selector = "01010"
    else FDEC when selector = "01011"
    else (others => '0') when selector = "01100"
    else FINV when selector = "01101"
    else '0' & B(n-1 DOWNTO 1) when selector = "01110"
    else B(0) & B(n-1 DOWNTO 1) when selector = "01111"
    else B(n-1) & B(n-1 DOWNTO 1) when selector = "10000"
    else B(n-2 DOWNTO 0) & '0' when selector = "10001"
    else B(n-2 DOWNTO 0) & B(n-1) when selector = "10010";

    cout <= cin when selector = "00001"
    else CADD when selector = "00010"
    else CADC when selector = "00011"
    else CSUB when selector = "00100" or (selector = "00101" and cin = '0')
    else CSBC when selector = "00101" and cin = '1'
    else CCMP when selector = "01001"
    else CINC when selector = "01010"
    else CDEC when selector = "01011"
    else '0';

END a_alu;