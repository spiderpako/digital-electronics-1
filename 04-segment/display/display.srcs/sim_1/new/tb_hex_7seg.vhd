------------------------------------------------------------
--
-- Testbench for 7-segment display decoder.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all; -- Definition of "to_unsigned"

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_hex_7seg is
-- Entity of testbench is always empty
end entity tb_hex_7seg;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_hex_7seg is

  -- Testbench local signals
  signal sig_blank : std_logic;
  signal sig_hex   : std_logic_vector(3 downto 0);
  signal sig_seg   : std_logic_vector(6 downto 0);

begin

  -- Connecting testbench signals with decoder entity
  -- (Unit Under Test)
  uut_hex_7seg : entity work.hex_7seg
    port map (
      blank => sig_blank,
      hex   => sig_hex,
      seg   => sig_seg
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";

    sig_blank <= '0';    -- Normal operation
    sig_hex   <= "0011"; -- Some default value
    wait for 50 ns;

    sig_blank <= '1';    -- Blank display
    wait for 150 ns;
    sig_blank <= '0';    -- Normal operation
    wait for 15 ns;

    -- Loop for all hex values
    for ii in 0 to 15 loop

      --Convert ii decimal value to 4-bit wide binary
      --s_hex <= std_logic_vector(to_unsigned(ii, s_hex'length));
      sig_hex <= std_logic_vector(to_unsigned(ii, 4));
      wait for 50 ns;

    case sig_hex is
    
    when "0000" => assert sig_seg ="0000001"
    report "Input combination 0000 failed"
    severity error;
    
    when "0001" => assert sig_seg ="1001111"
    report "Input combination 0001 failed"
    severity error;
    
    when "0010" => assert sig_seg ="0010010"
    report "Input combination 0010 failed"
    severity error;
    
    when "0011" => assert sig_seg ="0000110"
    report "Input combination 0011 failed"
    severity error;
    
    when "0100" => assert sig_seg ="1001100" --4
    report "Input combination 0100 failed"
    severity error;
    
    when "0101" => assert sig_seg ="0100100"
    report "Input combination 0101 failed"
    severity error;
    
    when "0110" => assert sig_seg ="0100000"
    report "Input combination 0110 failed"
    severity error;
    
    when "0111" => assert sig_seg ="0001111" --7
    report "Input combination 0111 failed"
    severity error;
    
    when "1000" => assert sig_seg ="0000000"
    report "Input combination 1000 failed"
    severity error;
    
    when "1001" => assert sig_seg ="0000100"
    report "Input combination 1001 failed" --9
    severity error;
    
    when "1010" => assert sig_seg ="0001000"
    report "Input combination 1010 failed"
    severity error;
    
    when "1011" => assert sig_seg ="1100000"
    report "Input combination 1011 failed" --b
    severity error;
    
    when "1100" => assert sig_seg ="0110001"
    report "Input combination 1100 failed"
    severity error;
    
    when "1101" => assert sig_seg ="1000010" --d
    report "Input combination 1101 failed"
    severity error;
    
    when "1110" => assert sig_seg ="0110000"
    report "Input combination 1110 failed"
    severity error;
    
    when others => assert sig_seg ="0111000" --F
    report "Input combination 1111 failed"
    severity error;
    
    end case;
    wait for 150 ns;
    end loop;

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;