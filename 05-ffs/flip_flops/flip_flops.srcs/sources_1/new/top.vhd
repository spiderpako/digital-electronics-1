----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 12:39:00 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK100MHZ : in STD_LOGIC; -- MAIN CLOCK
           BTNC : in STD_LOGIC; -- synchronous reset
           SW : in STD_LOGIC_VECTOR (0 downto 0); -- Shift register serial input
           LED : out STD_LOGIC_VECTOR (3 downto 0)); -- Shift register parallel input
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture behavioral of top is

  -- Internal signals between flip-flops
  signal sig_ff0 : std_logic;

  -- WRITE YOUR CODE HERE

begin

  --------------------------------------------------------------------
  -- Four instances (copies) of D-type FF entity
  d_ff_0 : entity work.d_ff_rst
      port map (
          clk => CLK100MHZ,
          rst => BTNC,
          -- WRITE YOUR CODE HERE
          
          q   => sig_ff0
      );

  d_ff_1 : entity work.d_ff_rst
      port map (
          clk => CLK100MHZ,
          rst => BTNC,
          -- WRITE YOUR CODE HERE

      );

  -- PUT OTHER TWO FLIP-FLOP INSTANCES HERE

end architecture behavioral;