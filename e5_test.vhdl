library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Test_Circuit5 is
end Test_Circuit5;

architecture behavior of Test_Circuit5 is
    component Circuit5 is
        Port (
            C2, C1, C0 : in std_logic;
            S0, S1, S2, S3, S4, S5, S6, S7 : out std_logic
        );
    end component;

    signal C2_t, C1_t, C0_t : std_logic;
    signal S0_t, S1_t, S2_t, S3_t, S4_t, S5_t, S6_t, S7_t : std_logic;

begin
    uut: Circuit5 port map (C2_t, C1_t, C0_t, S0_t, S1_t, S2_t, S3_t, S4_t, S5_t, S6_t, S7_t);
    stimulus: process
    begin
        C2_t <= '0'; C1_t <= '0'; C0_t <= '0';wait for 10 ns;
        assert (S0_t = '1' and S1_t = '0' and S2_t = '0' and S3_t = '0' and S4_t = '0' and S5_t = '0' and S6_t = '0' and S7_t = '0');

        C2_t <= '0'; C1_t <= '0'; C0_t <= '1';wait for 10 ns;
        assert (S0_t = '0' and S1_t = '0' and S2_t = '1' and S3_t = '0' and S4_t = '0' and S5_t = '0' and S6_t = '0' and S7_t = '0');

        C2_t <= '0'; C1_t <= '1'; C0_t <= '0';wait for 10 ns;
        assert (S0_t = '0' and S1_t = '0' and S2_t = '1' and S3_t = '0' and S4_t = '0' and S5_t = '0' and S6_t = '0' and S7_t = '0');
       
        C2_t <= '0'; C1_t <= '1'; C0_t <= '1';wait for 10 ns;
        assert (S0_t = '0' and S1_t = '0' and S2_t = '0' and S3_t = '1' and S4_t = '0' and S5_t = '0' and S6_t = '0' and S7_t = '0');

        C2_t <= '1'; C1_t <= '0'; C0_t <= '0';wait for 10 ns;
        assert (S0_t = '0' and S1_t = '0' and S2_t = '0' and S3_t = '0' and S4_t = '1' and S5_t = '0' and S6_t = '0' and S7_t = '0');
        
        C2_t <= '1'; C1_t <= '0'; C0_t <= '1';wait for 10 ns;
        assert (S0_t = '0' and S1_t = '0' and S2_t = '0' and S3_t = '0' and S4_t = '0' and S5_t = '1' and S6_t = '0' and S7_t = '0');
        
        C2_t <= '1'; C1_t <= '1'; C0_t <= '0';wait for 10 ns;
        assert (S0_t = '0' and S1_t = '0' and S2_t = '0' and S3_t = '0' and S4_t = '0' and S5_t = '0' and S6_t = '1' and S7_t = '0');
       
        C2_t <= '1'; C1_t <= '1'; C0_t <= '1';wait for 10 ns;
        assert (S0_t = '0' and S1_t = '0' and S2_t = '0' and S3_t = '0' and S4_t = '0' and S5_t = '0' and S6_t = '0' and S7_t = '1');
        wait;
    end process;

end behavior;
