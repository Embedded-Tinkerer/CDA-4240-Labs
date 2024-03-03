library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity reg_file_tb is
end reg_file_tb;

architecture behavioral of reg_file_tb is
    component reg_file is
        port(
            clk     : in  std_logic;
            rst     : in  std_logic;
            we      : in  std_logic;
            addr    : in  std_logic_vector(2 downto 0);
            din     : in  std_logic_vector(3 downto 0);
            dout    : out std_logic_vector(3 downto 0)
        );
    end component;
    
    constant PERIOD : time := 10 ns;
    
    signal clk     : std_logic;
    signal rst     : std_logic;
    signal we      : std_logic;
    signal addr    : std_logic_vector(2 downto 0);
    signal din     : std_logic_vector(3 downto 0);
    signal dout    : std_logic_vector(3 downto 0);
begin

    reg_file_inst: reg_file
    port map(
        clk     => clk,
        rst     => rst,
        we      => we,
        addr    => addr,
        din     => din,
        dout    => dout
    );

    clk_gen: process
    begin
        clk <= '0';
        wait for PERIOD/2;
        clk <= '1';
        wait for PERIOD/2;
    end process;

    tb: process
    begin
        -- Disable inputs
        rst  <= '1';
        we   <= '0';
        addr <= "000";
        din  <= "0000";
        
        -- Writes to registers
        we <= '1';
        addr <= "000"; din <= "0111"; wait for PERIOD;
        addr <= "001"; din <= "1101"; wait for PERIOD;
        addr <= "010"; din <= "1011"; wait for PERIOD;
        addr <= "011"; din <= "0010"; wait for PERIOD;
        addr <= "100"; din <= "1010"; wait for PERIOD;
        addr <= "101"; din <= "1110"; wait for PERIOD;
        addr <= "110"; din <= "1001"; wait for PERIOD;
        addr <= "111"; din <= "1100"; wait for PERIOD;
        we <= '0';

        -- Read from registers
        addr <= "000"; wait for 4 ns;
        addr <= "001"; wait for 4 ns;
        addr <= "010"; wait for 4 ns;
        addr <= "011"; wait for 4 ns;
        addr <= "100"; wait for 4 ns;
        addr <= "101"; wait for 4 ns;
        addr <= "110"; wait for 4 ns;
        addr <= "111"; wait for 4 ns;

        -- Reset
        rst <= '0';
        wait for 1 ns;
        rst <= '1';

        -- Read from registers
        addr <= "000"; wait for 4 ns;
        addr <= "001"; wait for 4 ns;
        addr <= "010"; wait for 4 ns;
        addr <= "011"; wait for 4 ns;
        addr <= "100"; wait for 4 ns;
        addr <= "101"; wait for 4 ns;
        addr <= "110"; wait for 4 ns;
        addr <= "111"; wait for 4 ns;
        wait;
    end process;
end behavioral;
