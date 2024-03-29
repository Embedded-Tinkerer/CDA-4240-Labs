
library ieee;
use ieee.std_logic_1164.all;

entity logic_unit is
    generic(n: integer := 6);
    port(
        sel  : in  std_logic_vector(1 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : out std_logic_vector(n-1 downto 0) 
    );
end logic_unit;

architecture dataflow of logic_unit is
-- ADDITIONAL SIGNALS GO HERE
-- LOGIC UNIT ARCHITECTURE GOES HERE

begin
    process(sel, a, b) is
        begin
        if(sel = "00") then
            r <= not A;
        elsif (sel = "01") then
            r <= A and B;
        elsif (sel = "10") then
            r <= A or B;
        else r <= A xor B;
        end if;
                        
    end process;

end architecture dataflow;


