LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(5 downto 0);
         B : IN  std_logic_vector(5 downto 0);
         Select : IN  std_logic_vector(3 downto 0);
         ALU_Out : OUT  std_logic_vector(5 downto 0);
         );
    END COMPONENT;
       --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Select : std_logic_vector(3 downto 0) := (others => '0');

  --Outputs
   signal ALU_Out : std_logic_vector(5 downto 0);
   
 
 signal i:integer;
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Select=> Select,
          ALU_Out => ALU_Out,
          );

   -- Stimulus process
   stim_proc: process
   begin  
      -- hold reset state for 100 ns.
      A <= "000100";
  B <= "000010";
  ALU_Sel <= "0000";
  
  for i in 0 to 15 loop 
   Select <= Select + "1";
   wait for 100 ns;
  end loop;
      A <= "110001";
    B <= "110010";
      wait for 100ns;
  A <= "111111";
  B <= "111111";
wait for 100ns;
   end process;

END;