library ieee;
use ieee.std_logic_1164.all;

entity logic_unit is
    generic(n: integer := 6);
    port(
        sel  : in  std_logic_vector(3 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : inout std_logic_vector(n-1 downto 0) 
    );
end logic_unit;

architecture dataflow of logic_unit is
-- ADDITIONAL SIGNALS GO HERE
signal logic_out : std_logic_vector(n-1 downto 0);

-- LOGIC UNIT ARCHITECTURE GOES HERE

begin
    process(sel, a, b) is
    begin
        case sel is
            when "1000" => 
                r <= not A;
            when "1001" =>
                r <= A and B;
            when "1010" => 
                r <= A or B;
            when "1011" =>
                r <= A xor B;
        end case;
        logic_out <= r;
    end process;

end architecture dataflow;


