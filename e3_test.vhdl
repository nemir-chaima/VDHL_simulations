library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity CircuitComplex_test is
end CircuitComplex_test;
architecture behavior of CircuitComplex_test is
  signal A, B, Cin, F0, F1, INVA, ENA, ENB : std_logic;
  signal C_out, X : std_logic;
begin
  uut: entity work.MAIN
    port map (
      A => A,
      B => B,
      Cin => Cin,
      F0 => F0,
      F1 => F1,
      INVA => INVA,
      ENA => ENA,
      ENB => ENB,
      C_out => C_out,
      X => X);
  process
  begin
    A <= '0';
    B <= '1';
    Cin <= '0';
    F0 <= '0';
    F1 <= '1';
    INVA <= '1';
    ENA <= '1';
    ENB <= '0';
    wait for 10 ns;
    report "C_out = " & std_logic'image(C_out);
    report "X = " & std_logic'image(X);
    wait;
  end process;
end behavior;
