----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/10/2023 11:00:00 PM
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is
component Program_Counter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal D,Q : STD_LOGIC_VECTOR(2 downto 0);
signal CLK,Reset : STD_LOGIC := '0';


begin
UUT: Program_Counter
Port Map(
    D => D,
    Reset => Reset,
    CLK => CLK,
    Q => Q);
    
process 
begin

wait for 10ns;
Clk <= NOT(Clk);
end process;
  
process
begin
   D <= "110";
   WAIT FOR 100 ns;
   
   D <= "011";
   WAIT FOR 100 ns;
   
   D <= "001";
   WAIT FOR 100 ns;
   
   D <= "010";
   WAIT FOR 100 ns;
       
   D <= "101";
   WAIT FOR 100 ns;
   
   D <= "111";
   WAIT; 
end process;

end Behavioral;
