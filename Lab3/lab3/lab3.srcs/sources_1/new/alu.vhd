library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port(
        sel  : in  std_logic_vector(3 downto 0);
        a    : in  std_logic_vector(5 downto 0);
        b    : in  std_logic_vector(5 downto 0);
        r    : out std_logic_vector(5 downto 0) 
    );
end alu;

architecture structural of alu is
    constant n : integer := 6;
    constant m : integer := 3;

    component adder is
        generic(n: integer := 6);
        port(
            sel  : in  std_logic_vector(1 downto 0);
            a    : in  std_logic_vector(n-1 downto 0);
            b    : in  std_logic_vector(n-1 downto 0);
            r    : out std_logic_vector(n-1 downto 0) 
        );
    end component;

    component mult is
        generic(n: integer := 6);
        port(
            sel  : in  std_logic(0);
            a    : in  std_logic_vector(n-1 downto 0);
            b    : in  std_logic_vector(n-1 downto 0);
            r    : out std_logic_vector(n-1 downto 0) 
        );
    end component;

    component logic_unit is
        generic(n: integer := 6);
        port(
            sel  : in  std_logic_vector(1 downto 0);
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
r <= out;

begin

-- ALU ARCHITECTURE GOES HERE 
process(sel, a, b)
begin
    case sel is
        when "0000" =>
            out <= a + b; -- addition
        when "0001" =>
            out <= a * b; -- multiplication
        when "0010" =>
            out <= a and b; -- bitwise AND
        when "0011" =>
            out <= a or b; -- bitwise OR
        when "0100" =>
            out <= a xor b; -- bitwise XOR
        when "0101" =>
            out <= a sll to_integer(unsigned(b)); -- left shift
        when "0110" =>
            out <= a srl to_integer(unsigned(b)); -- logical right shift
        when "1111" =>
            out <= a sra to_integer(unsigned(b)); -- arithmetic right shift
        when "1000" =>
            out <= not a; -- bitwise NOT
        when others =>
            out <= (others => 'X');
    end case;
end process;

end Behavioral;

https://www.chegg.com/homework-help/questions-and-answers/design-code-vhdl-alu-meets-following-requirements-q94277598