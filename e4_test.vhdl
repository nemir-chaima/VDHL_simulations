
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TestCompteurCirculaire is
end TestCompteurCirculaire;

architecture Behavioral of TestCompteurCirculaire is
    constant CLK_PERIOD : time := 10 ns;   
    signal hlg : std_logic := '0';
    signal r : std_logic := '0';
    signal compteur : natural;
begin
    uut: entity work.CompteurCirculaire
        generic map (
            MAX_COUNT => 20
        )
        port map (
            hlg => hlg,
            r => r,
            compteur => compteur
        );
    clk_process: process
    begin
        while now < 1000 ns loop
            hlg <= '0';
            wait for CLK_PERIOD / 2;
            hlg <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    reset_process: process
    begin
        r <= '1';
        wait for 50 ns;
        r <= '0';
        wait;
    end process;
    display_process: process
    begin
        while now < 1000 ns loop
            wait for CLK_PERIOD;
            report "Count: " & integer'image(compteur);
        end loop;
        wait;
    end process;
end Behavioral;
