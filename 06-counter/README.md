# Lab 6: Jakub Raimr

### Bidirectional counter

1. Listing of VHDL code of the completed process `p_cnt_up_down`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
 p_cnt_up_down : process (clk) is
  begin

    if rising_edge(clk) then
      if (rst = '1') then           -- Synchronous reset
        sig_cnt <= (others => '0'); -- Clear all bits
      elsif (en = '1') then         -- Test if counter is enabled

        -- TEST COUNTER DIRECTION
       if cnt_up = '1' then
          sig_cnt <= sig_cnt + 1;
       else sig_cnt <= sig_cnt - 1;
      end if;
    end if;
    end if;

  end process p_cnt_up_down;
```

2. Screenshot with simulated time waveforms. Test: (a) reset, (b) counter direction, (c) enable. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

<img width="937" alt="image" src="https://user-images.githubusercontent.com/95495159/225994947-6943a9c3-c6de-4b20-aef7-63e1400f76b9.png">
<img width="939" alt="image" src="https://user-images.githubusercontent.com/95495159/225994988-7bb1d45c-e2fa-40ca-8255-f03a595fcdcf.png">
<img width="937" alt="image" src="https://user-images.githubusercontent.com/95495159/225995100-384afe92-c12f-462a-812a-41beed788cc3.png">


### Two counters

1. Image of the top layer structure including both counters, ie a 4-bit bidirectional counter from *Part 4* and a 12-bit counter with a 10 ms time base from *Experiments on your own*. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   <img width="960" alt="image" src="https://user-images.githubusercontent.com/95495159/226022218-01873391-9a8c-4594-9d87-8fbb3ceb7bce.png">
