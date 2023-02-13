# Lab 1: Jakub Raimr

### De Morgan's laws

1. Equations of all three versions of logic function f(c,b,a):

   ![IMG_20230213_133729](https://user-images.githubusercontent.com/95495159/218548064-187e72d8-dd2e-4a12-8de2-a26d5bb17072.jpg)


2. Listing of VHDL architecture from design file (`design.vhd`) for all three functions. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture dataflow of gates is
begin

    f_orig_o <= (not(b_i) and a_i) or (c_i and not(b_i or not(a_i)));
    
    f_nand_o <= ((not b_i nand a_i) nand (c_i nand not(not b_i nand a_i)));
    
    f_nor_o  <= ((not(b_i nor not a_i) nor (c_i nor (b_i nor not a_i)))); 

end architecture dataflow;
```

3. Complete table with logic functions' values:

   | **c** | **b** |**a** | **f_ORIG** | **f_(N)AND** | **f_(N)OR** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 0 | 0 | 0 |
   | 0 | 0 | 1 | 1 | 1 | 1 |
   | 0 | 1 | 0 | 0 | 0 | 0 |
   | 0 | 1 | 1 | 0 | 0 | 0 |
   | 1 | 0 | 0 | 0 | 0 | 0 |
   | 1 | 0 | 1 | 1 | 1 | 1 |
   | 1 | 1 | 0 | 0 | 0 | 0 |
   | 1 | 1 | 1 | 0 | 0 | 0 |

### Distributive laws

1. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

<img width="906" alt="Snímek obrazovky_20230213_132139" src="https://user-images.githubusercontent.com/95495159/218548240-eb83b048-9f33-47a0-9aca-7b5b764db6dd.png">
   

2. Link to your public EDA Playground example:

   https://www.edaplayground.com/x/Z7SV
