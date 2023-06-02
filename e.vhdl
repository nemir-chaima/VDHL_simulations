library ieee;
use ieee.std_logic_1164.all;

entity Circuit is
  port (
    A, B, C : in std_logic;
    M : out std_logic
  );
end entity Circuit;

architecture Archi_Cicruit of Circuit is
begin
  process (A, B, C)
  begin
    if (((not A) and B and C) = '1' or (A and (not B) and C) = '1' or (A and B and (not C)) = '1'  or (A and B and C)= '1') then
      M <= '1';  -- La sortie M est activée 
    else
      M <= '0';  -- La sortie M est désactivée 
    end if;
  end process;
end architecture Archi_Cicruit;
