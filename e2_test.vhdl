library ieee;
use ieee.std_logic_1164.all;

entity test_comparateur is
end test_comparateur;
architecture behavior of test_comparateur is
  component comparateur is
    port (
      A, B : in std_logic;
      AsaB, AiaB, AeaB : out std_logic
    );
  end component;
  signal A_t, B_t, AsaB_t, AiaB_t, AeaB_t : std_logic;
begin
  uut: comparateur port map (A_t, B_t, AsaB_t, AiaB_t, AeaB_t);
  stimulus: process
  begin
    A_t <= '0';
    B_t <= '0';
    wait for 100 ns;
    assert (AsaB_t = '0');
    assert (AiaB_t = '0');
    assert (AeaB_t = '1');
    A_t <= '0';
    B_t <= '1';
    wait for 100 ns;
    assert (AsaB_t = '0');
    assert (AiaB_t = '1');
    assert (AeaB_t = '0');
    A_t <= '1';
    B_t <= '0';
    wait for 100 ns;
    assert (AsaB_t = '1');
    assert (AiaB_t = '0');
    assert (AeaB_t = '0');
    A_t <= '1';
    B_t <= '1';
    wait for 100 ns;
    assert (AsaB_t = '0');
    assert (AiaB_t = '0');
    assert (AeaB_t = '1');
    wait;
  end process;
end behavior;
