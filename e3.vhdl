library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Complex_Circuit is
    Port (
        A, B, ENA, ENB, F0, F1, C_in : in std_logic;
        X, C_out : out std_logic
    );
end Complex_Circuit;

architecture behavior of Complex_Circuit is
    component Mini_Circuit_1 is
        Port (
            A, ENA, INVA : in std_logic;
            S1 : out std_logic
        );
    end component;

    component Mini_Circuit_2 is
        Port (
            S1, B, ENB : in std_logic;
            AB, A_plus_B, NO_B : out std_logic
        );
    end component;

    component Mini_Circuit_3 is
        Port (
            F0, F1 : in std_logic;
            D1, D2, D3, D4 : out std_logic
        );
    end component;

    component Mini_Circuit_4 is
        Port (
            B, ENB, S1, D4, C_in : in std_logic;
            C_out : out std_logic
        );
    end component;

    component Mini_Circuit_5 is
        Port (
            AB, A_plus_B, NO_B : in std_logic;
            D1, D2, D3, D4 : in std_logic;
            C_in : in std_logic;
            X : out std_logic
        );
    end component;

    signal S1_t, AB_t, A_plus_B_t, NO_B_t, D1_t, D2_t, D3_t, D4_t : std_logic;

begin
    uut1: Mini_Circuit_1 port map (A, ENA, NOT A, S1_t);

    uut2: Mini_Circuit_2 port map (S1_t, B, ENB, AB_t, A_plus_B_t, NO_B_t);

    uut3: Mini_Circuit_3 port map (F0, F1, D1_t, D2_t, D3_t, D4_t);

    uut4: Mini_Circuit_4 port map (B, ENB, S1_t, D4_t, C_in, C_out);

    uut5: Mini_Circuit_5 port map (AB_t, A_plus_B_t, NO_B_t, D1_t, D2_t, D3_t, D4_t, C_in, X);

end behavior;


architecture behavior of Mini_Circuit_1 is
    signal temp1, temp2 : std_logic;
begin
    temp1 <= A and ENA;
    temp2 <= NOT A;
    S1 <= (temp1 and temp2) xor temp2;
end behavior;


architecture behavior of Mini_Circuit_2 is
begin
    AB <= S1 and (B and ENB);
    A_plus_B <= S1 or (B and ENB);
    NO_B <= NOT (B and ENB);
end behavior;


architecture behavior of Mini_Circuit_3 is
begin
    D1 <= NOT F0 and NOT F1;
    D2 <= NOT F0 and F1;
    D3 <= F0 and NOT F1;
    D4 <= F0 and F1;
end behavior;


architecture behavior of Mini_Circuit_4 is
begin
    C_out <= ((B and ENB) and S1 and D4) or (((B and ENB) xor S1) and D4 and C_in);
end behavior;


architecture behavior of Mini_Circuit_5 is
begin
    X <= ((AB and D1) or (A_plus_B and D2) or (NO_B and D3) or ((C_in xor ((B and ENB) xor S1)) and D4));
end behavior;
