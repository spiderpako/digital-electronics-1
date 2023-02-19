# Lab 2: Jakub Raimr

### 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

   Greater than:

   ![SoP min](https://github.com/spiderpako/digital-electronics-1/blob/main/02-logic/kmap_greater_than.png)

   Less than:

   ![PoS min](https://github.com/spiderpako/digital-electronics-1/blob/main/02-logic/kmap_less_than.png)

2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![IMG_20230219_143008](https://user-images.githubusercontent.com/95495159/219951564-d4d58f09-83f5-48db-bf09-db0ee66a7772.jpg)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **240 198**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started";

        -- Test case of ID
        s_b <= "1001"; -- 240 198 -> 1001 - BCD of 9
        s_a <= "1000"; -- 240 198 -> 1000 - BCD of 8
        wait for 100 ns;
        
        -- ... and its expected outputs        
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
                
        -- If true, then do not report anything
        -- If false, then report the following error

report "Input combination b=1001, a=1000 FAILED" severity error;

        -- Test case 2
        s_b <= "1001";
        s_a <= "1001";
        wait for 100 ns;
         
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '1') and
                (s_B_less_A    = '0'))
                       
report "Input combination b=1001, a=1001 FAILED" severity error;

        -- Test case 3
        s_b <= "1000";
        s_a <= "1100";
        wait for 100 ns;
         
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '1'))
                       
report "Input combination b=1000, a=1100 FAILED" severity error;
       
        -- Report a note at the end of stimulus process
        report "Stimulus process finished";
        wait; -- Data generation process is suspended forever
    end process p_stimulus;
```

2. Link to your public EDA Playground example:

   https://www.edaplayground.com/x/Fpf2
