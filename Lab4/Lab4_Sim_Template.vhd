library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
library std;
use std.textio.all;

entity mult_tb is
end mult_tb;

architecture behavioral of mult_tb is
    -- ADD "mult8x8.dat" AS A SIMULATION SOURCE FIRST

    -- file variable to read data from
    file MULT_FILE : text OPEN READ_MODE is "mult8x8.dat";

    -- create period constant

    -- mult components
    component mult is
        -- add ports here
    end component;

    -- add signals
    
begin
    -- instantiate mult component and complete the port map for it

    -- generate the process for the clock similar to previous lab 0 and lab 2

    -- variables for reading for MULT_FILE
    tb: process
        variable cur_line   : integer := 1;
        variable v_line     : line;
        variable v_space    : character;
        variable v_a        : std_logic_vector(7 downto 0);
        variable v_b        : std_logic_vector(7 downto 0);
        variable v_p_exp    : std_logic_vector(15 downto 0);

    begin     
        -- useful functions 
        -- while not endfile("FILE"): keeps reading until reaching the end of the file.
        -- readline("FILE","VARIABLE"): reads 1 line at a time from file and stores it in variable.
        -- hread("VARIABLE", "VARIABLE"): reads from the 1st variable into the 2nd variable in HEX format.
        -- read("VARIABLE", "VARIABLE"): reads from the 1st variable into the 2nd variable.

        -- you must replace "FILE" and "VARIABLE" with your file name and appropriate variable names.
        
        -- after reading the data into each variable, set your signals equal to the variables
        -- and wait for 2*PERIOD. Next, assert that your product is equal to the expected product,
        -- and then start reading from the next line. If all the products are correct, report that the
        -- simulation was complete.

    end process;
    

end behavioral;
