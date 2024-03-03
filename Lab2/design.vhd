library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reg_module is 
generic (N : integer := 4);
port(
    clock, rst, we : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR(N-1 downto 0);
    dout : out STD_LOGIC_VECTOR (N-1 downto 0)
);
end reg_module;

architecture behavioral of reg_module is
begin
        process (rst, we, clock) is  
        begin
        if (rst = '0') then
            dout <= "0000";
        elsif (rst = '1') then
            if (we = '1') AND (rising_edge(clock)) then
                dout <= din;
            end if;
        end if;
        end process;
end behavioral;

--------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_8to1 is
    generic (N : integer := 4);
    port(
        mux_in0, mux_in1, mux_in2, mux_in3, mux_in4, mux_in5, mux_in6, mux_in7 : in STD_LOGIC_VECTOR(N-1 downto 0);
        addr_mux : in STD_LOGIC_VECTOR(2 downto 0);
        dout_mux : out STD_LOGIC_VECTOR(N-1 downto 0)
    );
end mux_8to1;

architecture behavioral of mux_8to1 is
    begin
        process(addr_mux, mux_in0, mux_in1, mux_in2, mux_in3, mux_in4, mux_in5, mux_in6, mux_in7) is
        begin
            case addr_mux is
                when "000" =>
                    dout_mux <= mux_in0;
                when "001" =>
                    dout_mux <= mux_in1;
                when "010" =>
                    dout_mux <= mux_in2;
                when "011" =>
                    dout_mux <= mux_in3;
                when "100" =>
                    dout_mux <= mux_in4;
                when "101" =>
                    dout_mux <= mux_in5;
                when "110" =>
                    dout_mux <= mux_in6;
                when others =>
                    dout_mux <= mux_in7;
            end case;
        end process;
end architecture;
          


--------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity decoder_3to8 is
    port(
        din : in STD_LOGIC_VECTOR(2 downto 0);
        en : in STD_LOGIC;
        dout : out STD_LOGIC_VECTOR(7 downto 0)
    );
end decoder_3to8;

architecture behavioral of decoder_3to8 is
begin
    process(din, en) is
    begin
        if (en = '0') then
            dout <= "00000000";
            else
            case din is
                when "000" =>
                    dout <= "00000001";
                when "001" =>
                    dout <= "00000010";
                when "010" =>
                    dout <= "00000100";
                when "011" =>
                    dout <= "00001000";
                when "100" =>
                    dout <= "00010000";
                when "101" =>
                    dout <= "00100000";
                when "110" =>
                    dout <= "01000000";
                when others =>
                    dout <= "10000000";
            end case;
        end if;
    end process;
end behavioral;


--------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity reg_file is
    generic (N : INTEGER := 4);
    port(
        clk, rst, we : in STD_LOGIC;
        din : in STD_LOGIC_VECTOR(N-1 downto 0);
        dout : out STD_LOGIC_VECTOR(3 downto 0);
        addr : in STD_LOGIC_VECTOR(2 downto 0)
    );
end reg_file;


architecture structural of reg_file is 
--internal signals

signal reg_en : STD_LOGIC_VECTOR(7 downto 0);
type array_8of4 is array (0 to 7) of STD_LOGIC_VECTOR (3 downto 0);
signal mux_in : array_8of4;

-----component declaration
    component reg_module is
        port(
        clock, rst, we : in STD_LOGIC;
        din : in STD_LOGIC_VECTOR(3 downto 0);
        dout : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component reg_module;

    component decoder_3to8 is
        port(
        din : in STD_LOGIC_VECTOR(2 downto 0);
        en : in STD_LOGIC;
        dout : out STD_LOGIC_VECTOR(7 downto 0)   
        );
    end component decoder_3to8;

    component mux_8to1 is
        port(
        mux_in0 : in STD_LOGIC_VECTOR(N-1 downto 0);
        mux_in1 : in STD_LOGIC_VECTOR(N-1 downto 0); 
        mux_in2 : in STD_LOGIC_VECTOR(N-1 downto 0);
        mux_in3 : in STD_LOGIC_VECTOR(N-1 downto 0); 
        mux_in4 : in STD_LOGIC_VECTOR(N-1 downto 0); 
        mux_in5 : in STD_LOGIC_VECTOR(N-1 downto 0); 
        mux_in6 : in STD_LOGIC_VECTOR(N-1 downto 0); 
        mux_in7 : in STD_LOGIC_VECTOR(N-1 downto 0);
        addr_mux : in STD_LOGIC_VECTOR(2 downto 0);
        dout_mux : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component mux_8to1;

begin
--process(clk'Event) is

-----component instantiation
-----left side component, right side wrapper
    reg_module_inst_0 : reg_module
     port map(
        rst => rst,
        clock => clk,
        din => din,
        we => reg_en(0),
        dout => mux_in(0)(3 downto 0)
     );     
    reg_module_inst_1 : reg_module
     port map(
        rst => rst,
        clock => clk,
        din => din,
        we => reg_en(1),
        dout => mux_in(1)(3 downto 0)
     );     
    reg_module_inst_2 : reg_module
    port map(
        rst => rst,
        clock => clk,
        din => din,
        we => reg_en(2),
        dout => mux_in(2)(3 downto 0)
     );     
    reg_module_inst_3 : reg_module
    port map(
        rst => rst,
        clock => clk,
        din => din,
        we => reg_en(3),
        dout => mux_in(3)(3 downto 0)
     );     
    reg_module_inst_4 : reg_module
    port map(
        rst => rst,
        clock => clk,
        din => din,
        we => reg_en(4),
        dout => mux_in(4)(3 downto 0)
     );     
    reg_module_inst_5 : reg_module
    port map(
        rst => rst,
        clock => clk,
        din => din,
        we => reg_en(5),
        dout => mux_in(5)(3 downto 0)
     );     
    reg_module_inst_6 : reg_module
    port map(
        rst => rst,
        clock => clk,
        din => din,
        we => reg_en(6),
        dout => mux_in(6)(3 downto 0)
     );     
    reg_module_inst_7 : reg_module
    port map(
        rst => rst,
        clock => clk,
        din => din,
        we => reg_en(7),
        dout => mux_in(7)(3 downto 0)
     );     

    decoder_3to8_inst: decoder_3to8 port map (
        din => addr,
        en => we,
        dout => reg_en
        );
            
    mux_8to1_inst: mux_8to1 port map (
        addr_mux => addr,
        mux_in0 => mux_in(0),
        mux_in1 => mux_in(1),
        mux_in2 => mux_in(2),
        mux_in3 => mux_in(3),
        mux_in4 => mux_in(4),
        mux_in5 => mux_in(5),
        mux_in6 => mux_in(6),
        mux_in7 => mux_in(7),
        dout_mux => dout
        );

             
 end structural;
