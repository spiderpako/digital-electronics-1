------------------------------------------------------------
--
-- Testbench for tb_mux_3bit_4to1
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado 2020.2
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_mux_3bit_4to1 is
  -- Entity of testbench is always empty
end entity tb_mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_mux_3bit_4to1 is

  -- Testbench local signals
  signal s_a_i :  std_logic_vector (2 downto 0);
  signal s_b_i :  std_logic_vector (2 downto 0);
  signal s_c_i :  std_logic_vector (2 downto 0);
  signal s_d_i :  std_logic_vector (2 downto 0);
  signal s_sel_i :  std_logic_vector (1 downto 0);
  signal s_f_o :  std_logic_vector (2 downto 0);

begin

  -- Connecting testbench signals with tb_mux_3bit_4to1
  -- entity (Unit Under Test)
  uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
    port map (
      a_i  => s_a_i,
      b_i  => s_b_i,
      c_i  => s_c_i,
      d_i  => s_d_i,
      sel_i => s_sel_i,
      f_o => s_f_o
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    -- Report a note at the beginning of stimulus process
    report "Stimulus process started";

    -- First test case ...
    s_d_i <= "000";
    s_c_i <= "000";
    s_b_i <= "000";
    s_a_i <= "000";
    s_sel_i <= "00";
    wait for 100 ns;

    ------------------------------
    -- WRITE OTHER TEST CASES HERE
    s_d_i <= "001";
    s_c_i <= "100";
    s_b_i <= "001";
    s_a_i <= "010";
    s_sel_i <= "10";
    wait for 100 ns;
    
   s_d_i <= "100";
    s_c_i <= "011";
    s_b_i <= "110";
    s_a_i <= "001";
    s_sel_i <= "01";
    wait for 100 ns;
    
    s_d_i <= "111";
    s_c_i <= "011";
    s_b_i <= "110";
    s_a_i <= "111";
    s_sel_i <= "11";
    wait for 100 ns;

    s_d_i <= "111";
    s_c_i <= "111";
    s_b_i <= "111";
    s_a_i <= "011";
    s_sel_i <= "00";
    wait for 100 ns;
    
    wait; -- Data generation process is suspended forever

  end process p_stimulus;

end architecture testbench;