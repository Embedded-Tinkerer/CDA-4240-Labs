-- ******************************************************
-- ADDER
-- ******************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    generic(n: integer := 6);
    port(
        sel  : in  std_logic_vector(1 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : out std_logic_vector(n-1 downto 0) 
    );
end adder;

architecture dataflow of adder is
    signal carry_sel  : std_logic;
    signal sub        : std_logic;
    signal a_long     : unsigned(n downto 0);
    signal b_long     : unsigned(n downto 0);
    
    signal carry_long : unsigned(n downto 0);
    signal op1_long   : unsigned(n downto 0);
    signal op2_long   : unsigned(n downto 0);
    signal sum_long   : unsigned(n downto 0);

    signal sum        : std_logic_vector(n-1 downto 0);
    signal carry      : std_logic_vector(n-1 downto 0);
-- ADDER ARCHITECTURE GOES HERE
--begin
--    process(sel[1:0]) is
--        begin
--            case(sel[1:0])
 --           when 00 => sum <= a_long + b_long;
 --           when 01 => carry <= 


end dataflow;