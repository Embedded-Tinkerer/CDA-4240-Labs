library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity shifter is
    generic(n: integer := 6;
            m: integer := 3
            );

    port(
        sel  : in  std_logic_vector(1 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(m-1 downto 0);
        r    : out std_logic_vector(n-1 downto 0) 
    );
end shifter;

--architecture behavioral of shifter is
---- ADDITIONAL SIGNALS GO HERE
--signal temp: unsigned(n-1 downto 0);
--signal temp2: unsigned(n-1 downto 0);



---- SHIFTER ARCHITECTURE GOES HERE

--begin
--    process(sel,a,b) is
--    begin
--    temp  <= unsigned(b);
--    temp2 <= temp & "000000";
--        case(sel) is
--            when "10" => r <= a srl std_logic_vector(temp2);
--            when "11" => r <= a sra std_logic_vector(temp2);
--            when others => r <= a sll std_logic_vector(temp);

--        end case;
--    end process;

        
--end architecture behavioral;
architecture Behavioral of shifter is

signal temp_a: unsigned(n-1 downto 0);
signal temp_b: unsigned(m-1 downto 0);
signal shift_reg: std_logic_vector (n-1 downto 0);
signal temp_signed_to_std : signed (n-1 downto 0);

begin
    process(a, b, sel) is
    begin                                     
    
        case sel is
            when "00" => shift_reg <= std_logic_vector(unsigned(A) sll m);
            when "01" => shift_reg <= std_logic_vector(unsigned(A) sll m);
            when "10" => shift_reg <= std_logic_vector(unsigned(A) srl m);
            when others => shift_reg <= std_logic_vector(signed(A) srl m);
        end case;
        r <= shift_reg;
    end process;
end architecture Behavioral;