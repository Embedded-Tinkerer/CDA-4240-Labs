library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration
entity if_then_else is
    port(
        X  : in  std_logic_vector(1 downto 0);
        Y  : in  std_logic_vector(1 downto 0);
        Z  : out std_logic
    );
end if_then_else;

architecture behavioral of if_then_else is
    begin
    P1: process(X,Y)
        begin
        if (X = Y) then
            Z <= '1';
        else
            Z <= '0';
        end if;
    end process;
end behavioral; 




library ieee;
use ieee.std_logic_1164.all;

entity when_else is
    port(
        X  : in  std_logic_vector(1 downto 0);
        Y  : in  std_logic_vector(1 downto 0);
        Z  : out std_logic
    );
end when_else;

architecture dataflow of when_else is
begin
    Z <= '1' when (X = Y) else '0';
end dataflow;




library ieee;
use ieee.std_logic_1164.all;

entity boolean_equation is
    port(
        X  : in  std_logic_vector(1 downto 0);
        Y  : in  std_logic_vector(1 downto 0);
        Z  : out std_logic
    );
end boolean_equation;


architecture dataflow of boolean_equation is
signal temp : std_logic_vector (3 downto 0);
begin
    temp (3) <= not X(1) and not X(0) and not Y(1) and not Y(0);
    temp (2) <= not X(1) and X(0) and not Y(1) and Y(0);
    temp (1) <= X(1) and not X(0) and Y(1) and not Y(0);
    temp (0) <= X(1) and X(0) and Y(1) and Y(0);
    Z <= temp (3) or temp (2) or temp (1) or temp (0);
end dataflow;





library ieee;
use ieee.std_logic_1164.all;
Library UNISIM;
use UNISIM.vcomponents.all;

entity LUT_primitive is
    port(
        X  : in  std_logic_vector(1 downto 0);
        Y  : in  std_logic_vector(1 downto 0);
        Z  : out std_logic
    );
end LUT_primitive;


architecture primitive of LUT_primitive is
begin
   LUT4_inst : LUT4
   generic map (
      INIT => X"8421")
   port map (
      o => Z,   -- LUT general output
      I0 => Y(0), -- LUT input
      I2 => X(0), -- LUT input
      I1 => Y(1), -- LUT input
      I3 => X(1)  -- LUT input
   );
end primitive ;




library ieee;
use ieee.std_logic_1164.all;
Library UNISIM;
use UNISIM.vcomponents.all;


entity comparator_top is
    port(
        X  : in  std_logic_vector(1 downto 0);
        Y  : in  std_logic_vector(1 downto 0);
        Z  : out std_logic_vector(3 downto 0)
    );
end comparator_top;



architecture structural of comparator_top is
-- Component Declarations
    component if_then_else is
        port( X,Y : in std_logic_vector (1 downto 0);
            Z : out std_logic );
    end component;

    component when_else is
        port( X,Y : in std_logic_vector (1 downto 0);
        Z : out std_logic );
    end component;

    component boolean_equation is
        port( X,Y : in std_logic_vector (1 downto 0);
        Z : out std_logic );
    end component;

    component LUT_primitive is
        port( X,Y : in std_logic_vector (1 downto 0);
        Z : out std_logic );
    end component;


begin
-- Component Port Maps
    if_then_else0 : if_then_else port map(
        X => X,
        Y => Y,
        Z => Z(3));
    when_else0 : when_else port map(
        X => X,
        Y => Y,
        Z => Z(2));
    boolean_equation0 : boolean_equation port map(
        X => X,
        Y => Y,
        Z => Z(1));
    LUT_primitive0 : LUT_primitive port map(
        X => X,
        Y => Y,
        Z => Z(0));

end structural ;