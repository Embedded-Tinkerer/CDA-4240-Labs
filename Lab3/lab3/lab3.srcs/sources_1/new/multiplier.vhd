library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mult is
    generic(n: integer := 6);
    port(
        sel  : in  std_logic;
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : out std_logic_vector(n-1 downto 0) 
    );
end mult;

architecture dataflow of mult is

-- ADDITIONAL SIGNALS GO HERE
signal temp : unsigned(2*n-1 downto 0);
-- MULTIPLIER ARCHITECTURE GOES HERE

begin 
    process(sel, a, b) is
        begin
        temp <= unsigned(a) * unsigned(b);
        case (sel) is
            when '0' => r <= std_logic_vector(temp(n-1 downto 0));
            when others => r <= std_logic_vector(temp(2*n-1 downto n));
            end case;
            
    end process;

end architecture dataflow;