
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifter is
    generic(n: integer := 6);
    
    port(
        sel  : in  std_logic_vector(1 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : out std_logic_vector(n-1 downto 0) 
    );
end shifter;

architecture behavioral of shifter is
-- ADDITIONAL SIGNALS GO HERE
signal temp: unsigned(n-1 downto 0);
signal temp2: unsigned(n-1 downto 0);



-- SHIFTER ARCHITECTURE GOES HERE

begin
    process(sel,a,b) is
    begin
    temp  <= unsigned(b);
    temp2 <= temp & "000000";
        case(sel) is
            when "10" => r <= a srl std_logic_vector(temp2);
            when "11" => r <= a sra std_logic_vector(temp2);
            when others => r <= a sll std_logic_vector(temp);
        end case;
    end process;

        
end architecture behavioral;
