library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

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

-- ADDITIONAL SIGNALS GO HERE
signal adder_out  : std_logic_vector(n-1 downto 0);
signal mult_out   : std_logic_vector(n-1 downto 0);
signal logic_out  : std_logic_vector(n-1 downto 0);
signal shift_out  : std_logic_vector(n-1 downto 0);



    component adder is
        generic(n: integer := 6);
        port(
            sel  : in  std_logic_vector(1 downto 0);
            a    : in  std_logic_vector(n-1 downto 0);
            b    : in  std_logic_vector(n-1 downto 0);
            r   : out std_logic_vector(n-1 downto 0) 
        );
    end component;

    component mult is
        generic(n: integer := 6);
        port(
            sel  : in  std_logic;
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
    
begin

-- ALU ARCHITECTURE GOES HERE 


adder_module_inst : adder 
    port map(
            sel => sel(1 downto 0),
            a => a,
            b => b,
            r => adder_out
            );
mult_module_inst : mult
    port map(
            sel => sel(0),
            a => a,
            b => b,
            r => mult_out
            );

logic_module_inst : logic_unit
    port map(
          sel => sel(1 downto 0),
          a => a,
          b => b,
          r => logic_out
          );

shifter_module_inst : shifter
        port map(
          sel => sel(1 downto 0),
          a => a,
          b => b,
          r => shift_out
          ); 

process(sel(3 downto 2), a, b) is
begin
    case (sel(3 downto 2)) is
        when "00" => r <= adder_out;
        when "01" => r <= mult_out;
        when "10" => r <= logic_out;
        when others => r <= shift_out;
    end case;           
end process;
end architecture structural;

