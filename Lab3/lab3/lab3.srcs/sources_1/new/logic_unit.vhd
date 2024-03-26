library ieee;
use ieee.std_logic_1164.all;

entity logic_unit is
    generic(n: integer := 6);
    port(
        sel  : in  std_logic_vector(3 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : out std_logic_vector(n-1 downto 0) 
    );
end logic_unit;

architecture dataflow of logic_unit is
-- ADDITIONAL SIGNALS GO HERE
signal logic_out : std_logic_vector(n-1 downto 0);

-- LOGIC UNIT ARCHITECTURE GOES HERE
begin
    process(sel,a,b) is
    begin
        case(sel) is
            when "1000" => r <= a NOT b;
            when "1001" => r <= a AND b;
            when "1010" => r <= a OR b;
            when "1011" r <= a XOR b;
            logic_out <= r;
            end case ;
    end process;

end dataflow;
