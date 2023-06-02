library ieee;
use ieee.std_logic_1164.all;
entity MiniCircuit1 is
  port(
    A,B,C,D,E : in std_logic;
    B1, B2: out std_logic);
end MiniCircuit1;
architecture arch_miniCircuit1 of MiniCircuit1 is
begin
	B1 <= A xor (B and C);
        B2 <= D and E;
end arch_miniCircuit1;
library ieee;
use ieee.std_logic_1164.all;
entity UNITE_LOGIQUE is
    port(
      A,B : in std_logic;
      S1, S2, S3 : out std_logic);
  end UNITE_LOGIQUE; 
  architecture arch_uni_log of UNITE_LOGIQUE is
  begin
      S1 <= A and B;
      S2 <= A or B; 
      S3 <= not B;
  end arch_uni_log;
  library ieee;
  use ieee.std_logic_1164.all;
  entity DECODEUR is
    port(
      F0, F1 : in std_logic;
      D1, D2, D3, D4 : out std_logic);
  end DECODEUR;
  architecture arch_dec of DECODEUR is
  begin
      D1 <= not F0 and not F1;
      D2 <= not F0 and F1; 
      D3 <= F0 and not F1;
      D4 <= F0 and F1;
  end arch_dec;
  library ieee;
use ieee.std_logic_1164.all;
entity ADDIT is
  port(
    A,B,C,D : in std_logic;
    A1, A2 : out std_logic);
end ADDIT;
architecture arch_add of ADDIT is
begin
	A1 <= (A and B and D) or ((A xor B) and C and D);
	A2 <= (A xor B) xor C; 
end arch_add;
library ieee;
use ieee.std_logic_1164.all;

entity MULTIP is
  port(
    A,B,C,D,E,F,G,H : in std_logic;
    M : out std_logic);
end MULTIP;
architecture arch_mul of MULTIP is
begin
	M <= (A and B) or (C and D) or (E and F) or (G and H);
end arch_mul;

library ieee;
use ieee.std_logic_1164.all;
use work.all;
entity MAIN is
  port(
    A,B,Cin,F0,F1,INVA, ENA, ENB : in std_logic;
    C_out, X: out std_logic);
end MAIN;
architecture arch_Circuit_Complexe of MAIN is
    component MiniCircuit1 is	
    port(   A,B,C,D,E : in std_logic;
            B1, B2: out std_logic);
    end component;
    component UNITE_LOGIQUE is	
    port(   A: in std_logic;
            B: in std_logic;
    	    S1: out std_logic;
	    S2: out std_logic;
            S3: out std_logic );
    end component;
    component ADDIT is	
    port(   A,B,C,D : in std_logic;
            A1, A2 : out std_logic);
    end component;
    component MULTIP is	
    port(   A,B,C,D,E,F,G,H : in std_logic;
            M : out std_logic);
    end component;
    component DECODEUR is	
    port(   F0, F1 : in std_logic;
            D1, D2, D3, D4 : out std_logic);
    end component;
    signal B1, B2 : std_logic;
    signal UL1, UL2, UL3 : std_logic;
    signal D1, D2, D3, D4 : std_logic;
    signal A1 : std_logic;
begin
    Porte1: MiniCircuit1 port map (A=>INVA, B=>A, C=>ENA, D=>B, E=>ENB, B1=>B1, B2=>B2);
    Porte2: UNITE_LOGIQUE port map (A=>B1, B=>B2, S1=>UL1, S2=>UL2, S3=>UL3);
    Porte3: DECODEUR port map (F0=>F0, F1=>F1, D1=>D1, D2=>D2, D3=>D3, D4=>D4);
    Porte4: ADDIT port map (A=>B1, B=>B2, C=>Cin, D=>D4, A1=>C_out, A2=>A1);
    Porte5: MULTIP port map (A=>UL1,B=>D1,C=>UL2,D=>D2,E=>UL3,F=>D3,G=>A1,H=>D4, M=>X);
end arch_Circuit_Complexe;
