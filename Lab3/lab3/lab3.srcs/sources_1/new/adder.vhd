-- ******************************************************
-- ADDER
-- ******************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity adder is
    generic(n: integer := 6);
    port(
        sel  : in  std_logic_vector(3 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : inout std_logic_vector(n-1 downto 0) 
    );
end adder;

architecture dataflow of adder is
-- ADDITIONAL SIGNALS GO HERE
    signal tmp        : std_logic_vector(n-1 downto 0);
    signal adder_out  : std_logic_vector(n-1 downto 0);
    
    signal carry_sel  : std_logic;
    signal sub        : std_logic;
    signal a_long     : unsigned(n downto 0);
    signal b_long     : unsigned(n downto 0);
    
    signal carry_long : unsigned(n downto 0);
    signal op1_long   : unsigned(n downto 0);
    signal op2_long   : unsigned(n downto 0);
    signal sum_long   : unsigned(n downto 0);

    signal sum        : std_logic_vector(n-1 downto 0):= A + B;
    signal carry      : std_logic_vector(n-1 downto 0);   
    signal difference : std_logic_vector(n-1 downto 0);
    signal borrow     : std_logic_vector(n-1 downto 0);  
    

    
         
--ADDER ARCHITECTURE GOES HERE

begin
    process(sel, a, b)
    begin
        case sel is
                when "0000" => r <= sum;
                when "0001" => r <= carry;
                when "0010" => r <= difference;
                when "0011" => r <= borrow;
        end case;
        adder_out <= r;
    end process;
            
end architecture dataflow;