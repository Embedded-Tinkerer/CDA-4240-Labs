-- ******************************************************
-- ADDER
-- ******************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    generic(n: integer := 6);
    port(
        sel  : in  std_logic_vector(1 downto 0);
        a    : in  std_logic_vector(n-1 downto 0);
        b    : in  std_logic_vector(n-1 downto 0);
        r    : out std_logic_vector(n-1 downto 0) 
    );
end adder;

architecture dataflow of adder is
    signal carry_sel  : std_logic;
    signal sub        : std_logic;
    signal a_long     : unsigned(n downto 0);
    signal b_long     : unsigned(n downto 0);
    
    signal carry_long : unsigned(n downto 0);
    signal op1_long   : unsigned(n downto 0);
    signal op2_long   : unsigned(n downto 0);
    signal sum_long   : unsigned(n downto 0);

    signal sum        : std_logic_vector(n-1 downto 0);
    signal carry      : std_logic_vector(n-1 downto 0);
-- ADDER ARCHITECTURE GOES HERE

end dataflow;

-- ******************************************************
-- MULTIPLIER
-- ******************************************************

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

begin

-- MULTIPLIER ARCHITECTURE GOES HERE

end dataflow;

-- ******************************************************
-- LOGIC UNIT
-- ******************************************************
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

begin

-- LOGIC UNIT ARCHITECTURE GOES HERE

end dataflow;

-- ******************************************************
-- SHIFTER
-- ******************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifter is
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
end shifter;

architecture dataflow of shifter is

-- ADDITIONAL SIGNALS GO HERE

begin

-- SHIFTER ARCHITECTURE GOES HERE

end dataflow;

-- ******************************************************
-- ALU WRAPPER
-- ******************************************************
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

-- ADDITIONAL SIGNALS GO HERE
signal adder_out  : std_logic_vector(n-1 downto 0);
signal mult_out  : std_logic_vector(n-1 downto 0);
signal logic_out  : std_logic_vector(n-1 downto 0);
signal shift_out  : std_logic_vector(n-1 downto 0);


begin

-- ALU ARCHITECTURE GOES HERE 
process(sel, a, b) is
begin
    case( sel [3:2] ) is
        when 00 => r <= adder_out;
        when 01 => r <= mult_out;
        when 10 => r <= logic_out;
        when others r <= shift_out;
    end case ;

end structural;
