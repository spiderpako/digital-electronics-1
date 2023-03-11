library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_top is
  -- Entity of testbench is always empty
end entity tb_top;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_top is

constant c_CLK_100MHZ_PERIOD : time := 10 ns;

--Local signals
    signal sig_clk : std_logic;
    signal sig_btnc : std_logic;
    signal sig_sw : std_logic;
    signal sig_led : std_logic_vector (3 downto 0);

       
begin
    -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
    uut_top : entity work.top
        port map (
            CLK100MHZ   => sig_clk,
            BTNC   => sig_btnc,
            SW     => sig_sw,
            LED => sig_led
            
        );

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process is
    begin
        while now < 300 ns loop -- 30 periods of 100MHz clock
            sig_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            sig_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process is
    begin
        report "Stimulus process started";
        sig_sw <= '0'; wait for 31 ns;
        sig_sw <= '1'; wait for 32 ns;
        sig_sw <= '0'; wait for 15 ns;
        sig_sw <= '1'; wait for 11 ns;
        sig_sw <= '0'; wait for 8 ns;
        sig_sw <= '1'; wait for 61 ns;
                
        wait for 50 ns;
        

        report "Stimulus process finished";
        wait;
    end process p_stimulus;

end architecture testbench;