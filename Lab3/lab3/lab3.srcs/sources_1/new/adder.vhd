-- ******************************************************
-- ADDER
-- ******************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    generic(n: integer := 6);
    port(
        sel  : in  std_logic_vector(3 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : out std_logic_vector(n-1 downto 0) 
    );
end adder;

architecture dataflow of adder is

    signal tmp        : std_logic_vector(n-1 downto 0);
    signal adder_out  : std_logic_vector(n-1 downto 0);

 ADDER ARCHITECTURE GOES HERE
begin
    process(sel) is
        begin
            case(sel)
            when "0000" => adder_out <= a + b;
            when "0001" => tmp <= ('0'& A) +('0' & B);
                adder_out <= tmp[6];
            when "0010" => adder_out <= a_long - b_long;
            when "0011" => tmp <= ('0'& A) - ('0' & B);
                adder_out <= tmp[6];
            end case;
            end process;
            
end dataflow;