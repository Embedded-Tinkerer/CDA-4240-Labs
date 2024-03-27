library ieee;
use ieee.std_logic_1164.all;

entity alu is
    generic(n: integer := 6);
    port(
        sel  : in  std_logic_vector(3 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : out std_logic_vector(n-1 downto 0) 
    );
end alu;

architecture structural of alu is
   -- constant m : integer := 3;

    component adder is
        generic(n: integer := 6);
        port(
            sel  : in  std_logic_vector(3 downto 0);
            a    : in  std_logic_vector(n-1 downto 0);
            b    : in  std_logic_vector(n-1 downto 0);
            r    : out std_logic_vector(n-1 downto 0) 
        );
    end component;

    component mult is
        generic(n: integer := 6);
        port(
            sel  : in  std_logic_vector(3 downto 0);
            a    : in  std_logic_vector(n-1 downto 0);
            b    : in  std_logic_vector(n-1 downto 0);
            r    : out std_logic_vector(n-1 downto 0) 
        );
    end component;

    component logic_unit is
        generic(n: integer := 6);
        port(
            sel  : in  std_logic_vector(3 downto 0);
            a    : in  std_logic_vector(n-1 downto 0);
            b    : in  std_logic_vector(n-1 downto 0);
            r    : out std_logic_vector(n-1 downto 0) 
        );
    end component;

    component shifter is
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
    end component;

-- ADDITIONAL SIGNALS GO HERE
signal adder_out  : std_logic_vector(n-1 downto 0);
signal mult_out  : std_logic_vector(n-1 downto 0);
signal logic_out  : std_logic_vector(n-1 downto 0);
signal shift_out  : std_logic_vector(n-1 downto 0);


begin

-- ALU ARCHITECTURE GOES HERE 
process(sel, a, b) is
begin
    case (sel) is
        when "0000" => r <= adder_out;
        when "0001" => r <= adder_out;
        when "0010" => r <= adder_out;
        when "0011" => r <= adder_out;
        when "0100" => r <= mult_out;
        when "0101" => r <= mult_out;
        when "0110" => r <= mult_out;
        when "0111" => r <= mult_out;
        when "1000" => r <= logic_out;
        when "1001" => r <= logic_out;
        when "1010" => r <= logic_out;
        when "1011" => r <= logic_out;
        when "1100" => r <= shift_out;
        when "1101" => r <= shift_out;
        when "1110" => r <= shift_out;
        when "1111" => r <= shift_out;
    end case;
    
        
end process;

end architecture structural;

