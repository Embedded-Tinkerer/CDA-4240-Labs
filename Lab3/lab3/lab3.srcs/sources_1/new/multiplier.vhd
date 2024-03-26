library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;

entity mult is
    generic(n: integer := 6);
    port(
        sel  : in  std_logic_vector(3 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : inout std_logic_vector(n-1 downto 0) 
    );
end mult;

architecture dataflow of mult is

-- ADDITIONAL SIGNALS GO HERE
signal temp : std_logic_vector(2*n-1 downto 0);
signal mult_out : std_logic_vector(n-1 downto 0);
-- MULTIPLIER ARCHITECTURE GOES HERE


begin
    temp <= a*b;
    process(sel, a, b) is 
    begin
        case(sel) is
            when "0110" => r <= temp(n-1 downto 0);
            when "0100" => r <= temp(n-1 downto 0);
            when "0111" => r <= temp(2*n-1 downto n);
            when "0101" => r <= temp(2*n-1 downto n);
        end case;
        
    mult_out <= r;
    end process;

end architecture dataflow;