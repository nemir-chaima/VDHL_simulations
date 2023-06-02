library ieee;
use ieee.std_logic_1164.all;

entity COMPARATEUR is
  port(
    A,B : in std_logic;
    AsaB, AiaB, AeaB : out std_logic
);
end COMPARATEUR;
architecture Archi_comp of comparateur is
begin
  	asab <= '1' when a > b else '0';
  	aiab <= '1' when a < b else '0';
  	aeab <= '1' when a = b else '0';
end Archi_comp;
