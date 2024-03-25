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
    process(sel,a,b) is
    begin
        case(sel) is
            when "00" => r <= a NOT b;
            when "01" => r <= a AND b;
            when "10" => r <= a OR b;
            when others r <= a XOR b
            end case ;
    end process;

end dataflow;
