# Lab 5: Jakub Raimr

### D & T Flip-flops

1. Screenshot with simulated time waveforms. Try to simulate both D- and T-type flip-flops in a single testbench with a maximum duration of 350 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

![image](https://user-images.githubusercontent.com/95495159/224009164-c2dc5519-f562-4ce0-ad77-b673cf3a0b4c.png)

### JK Flip-flop

1. Listing of VHDL architecture for JK-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture Behavioral of jk_ff_rst is
signal sig_q : std_logic;
begin

 p_d_ff_rst : process (clk) is
    begin
        if rising_edge(clk) then
            if (j = '0' and k ='0') then 
                sig_q <= sig_q;
                        
        elsif (j = '0' and k = '1') then
                sig_q <= j;
        elsif (j = '1' and k = '0') then
                sig_q <= j;
        else
                sig_q <= not(sig_q);
                end if;
        end if;
    
    end process p_d_ff_rst;
    
q     <= sig_q; -- Output ports are permanently connected to local signal
q_bar <= not sig_q;
    
end architecture behavioral;
```

### Shift register

1. Image of `top` level schematic of the 4-bit shift register. Use four D-type flip-flops and connect them properly. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   <img width="511" alt="image" src="https://user-images.githubusercontent.com/95495159/224483852-c2cb1f25-5bbb-414d-a58b-ec0f498dc537.png">
