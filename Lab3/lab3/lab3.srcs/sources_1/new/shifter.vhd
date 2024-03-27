library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;

entity shifter is
    generic(
        n: integer := 6;
        m: integer := 3
    );
    port(
        sel  : in  std_logic_vector(3 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : inout std_logic_vector(n-1 downto 0) 
    );
end shifter;

architecture behavioral of shifter is
-- ADDITIONAL SIGNALS GO HERE
signal shift_out : std_logic_vector(n-1 downto 0);

-- SHIFTER ARCHITECTURE GOES HERE

begin
    process(sel,a,b)
    begin
        case(sel) is
            when "1101" or "1100" => r <= a srl std_logic_vector(unsigned(b));
            when "1110" => r <= a srl  std_logic_vector(unsigned(b)) & "000000";
            when "1111" => r <= (a sra  std_logic_vector(unsigned(b))) & "000000";
        end case;
        shift_out <= r;
    end process;

        
end architecture behavioral;