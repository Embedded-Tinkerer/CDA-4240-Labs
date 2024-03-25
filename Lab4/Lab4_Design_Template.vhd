-- FULL_ADDER COMPONENT
library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        -- add ports for full_adder as described in the pdf
    );
end full_adder;

architecture dataflow of full_adder is
    -- add signals here if needed
begin
    -- write the architecture for full_adder based on Figure 1 schematic

end dataflow;




-- CARRY_SAVE_MULT COMPONENT
library ieee;
use ieee.std_logic_1164.all;

entity carry_save_mult is
    -- add generic n
    generic ( );
    port(
        -- add ports for carry_save_mult as described in the pdf
    );
end carry_save_mult;

architecture structural of carry_save_mult is
    -- add full_adder as component

    -- variable array of n-bit std_logic_vector
    type arr2d is array (integer range <>) of std_logic_vector(n-1 downto 0);
    -- signal ab has dimensions (n x n)
    signal ab : arr2d(0 to n-1);

    -- full_adder signals, all have dimension ((n-1) x n)
    signal FA_a    : arr2d(0 to n-2);
    signal FA_b    : arr2d(0 to n-2);
    signal FA_cin  : arr2d(0 to n-2);
    signal FA_sum  : arr2d(0 to n-2);
    signal FA_cout : arr2d(0 to n-2);
    
begin
    -- use nested for-generate to assign values to ab 2D-array
    gen_ab_rows: for i in 0 to n-1 generate
        gen_ab_cols: for j in 0 to n-1 generate
        -- write code here
        end generate;
    end generate;
    
    -- Figure 3 shows that we will use ((n-1) x n) full adders
    -- use nested for-generate to instantiate each full_adder component.
    -- ports are mapped to each bit of the 2D-arrays FA_a, FA_b, FA_cin, FA_sum, FA_cout

    -- after instantiating the full adders, we need to assign values 
    -- for the inputs of the FAs.
    -- use the three patterns from the pdf to complete this part
    -- and assign values to each row.

    -- First row:

    -- Intermediate rows:

    -- Last row:

    -- finally, do the last steps to compute the product.

    -- Product:

end structural;




-- MULT WRAPPER
library ieee;
use ieee.std_logic_1164.all;

entity mult is
    port(
        -- add ports for mult as described in the pdf
    );
end mult;

architecture structural of mult is

    -- add carry_save_mult as a component
    -- we don't need to the full_adder as component here

    -- signals
    signal a_reg  : std_logic_vector(7 downto 0);
    signal b_reg  : std_logic_vector(7 downto 0);
    signal p_s    : std_logic_vector(15 downto 0);
    
begin

    -- instantiate carry_save_mult (create port map)


    reg_mult : process(clk)
    begin
        if rising_edge(clk) then
            -- on the rising edge, make the signals equal
            -- to the inputs and outputs carry_save_mult

        end if;
    end process;

end structural;

-- after completing the design, write the simulation testbench.
-- make sure to add "create clock -period 10 -name clk [get ports clk]" to your constraints file.