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
signal result : signed(2*n-1 downto 0)
result <= a*b;
-- MULTIPLIER ARCHITECTURE GOES HERE

begin

    process(sel, a, b)
    if (sel == 0) then
        r <= result(n-1 downto 0);
    else r <= result(2*n-1 downto n);
    end if;
    end process;

end dataflow;