library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifter is
    generic(
        n: integer := 6;
        m: integer := 3
    );
    port(
        sel  : in  std_logic_vector(1 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(m-1 downto 0);
        r    : out std_logic_vector(n-1 downto 0) 
    );
end shifter;

architecture dataflow of shifter is
-- ADDITIONAL SIGNALS GO HERE

begin
    process(sel,a,b) is
    begin
        case(sel) is
            when "10" => r <= shift_left(a, b);
            when "11" => r <= shift_right(a, b);
            when others r <= shift_left(a, b);
        end case;
    end process;

        

-- SHIFTER ARCHITECTURE GOES HERE

end dataflow;