library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity test_circuit is
end test_circuit;

architecture behavior of test_circuit is
    component Circuit is
        Port (
            A, B, C : in STD_LOGIC;
            M : out STD_LOGIC
        );
    end component;

    signal A_t, B_t, C_t, M : STD_LOGIC;

begin
    uut: Circuit port map (A_t, B_t, C_t, M);

    stimulus: process
    begin
        A_t <= '0'; B_t <= '0'; C_t <= '0'; wait for 100 ns;
        assert (M = '0');
        A_t <= '0'; B_t <= '0'; C_t <= '1'; wait for 100 ns;
        assert (M = '0');
        A_t <= '0'; B_t <= '1'; C_t <= '0'; wait for 100 ns;
        assert (M = '0');
        A_t <= '0'; B_t <= '1'; C_t <= '1'; wait for 100 ns;
        assert (M = '1');
        A_t <= '1'; B_t <= '0'; C_t <= '0'; wait for 100 ns;
        assert (M = '0');
        A_t <= '1'; B_t <= '0'; C_t <= '1'; wait for 100 ns;
        assert (M = '1');
        A_t <= '1'; B_t <= '1'; C_t <= '0'; wait for 100 ns;
        assert (M = '1');
        A_t <= '1'; B_t <= '1'; C_t <= '1'; wait for 100 ns;
        assert (M = '1');
        wait;
    end process;


end behavior;
