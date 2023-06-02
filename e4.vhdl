library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CompteurCirculaire is
    generic (
        MAX_COUNT : natural := 20
    );
    port (
        hlg : in STD_LOGIC;
        r : in STD_LOGIC;
        compteur : out natural range 0 to MAX_COUNT
    );
end CompteurCirculaire;
architecture Behavioral of CompteurCirculaire is
    signal count : natural range 0 to MAX_COUNT;
begin
    process (hlg, r)
    begin
        if r = '1' then
            count <= MAX_COUNT;
        elsif falling_edge(hlg) then
            if count = 0 then
                count <= MAX_COUNT;
            else
                count <= count - 1;
            end if;
        end if;
    end process;
    compteur <= count;
end Behavioral;