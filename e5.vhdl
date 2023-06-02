library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Circuit5 is
    Port (
        C2, C1, C0 : in std_logic;
        S0, S1, S2, S3, S4, S5, S6, S7 : out std_logic
    );
end Circuit5;

architecture behavior of Circuit5 is
begin
    S0 <= not C2 and not C1 and not C0;
    S1 <= not C2 and not C1 and C0;
    S2 <= not C2 and C1 and not C0;
    S3 <= not C2 and C1 and C0;
    S4 <= C2 and not C1 and not C0;
    S5 <= C2 and not C1 and C0;
    S6 <= C2 and C1 and not C0;
    S7 <= C2 and C1 and C0;
end behavior;
