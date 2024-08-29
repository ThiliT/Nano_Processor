----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 12:02:04 PM
-- Design Name: 
-- Module Name: TB_Adder_3bit - Behavioral
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

entity TB_Adder_3bit is
--  Port ( );
end TB_Adder_3bit;

architecture Behavioral of TB_Adder_3bit is
component Adder_3_Bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       C_in : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal A, S : STD_LOGIC_VECTOR(2 downto 0);
signal C_in : STD_LOGIC := '0';

begin
UUT: Adder_3_Bit
Port Map(
    A => A,
    C_in => C_in,
    S =>S );
        
process
    begin
        A <= "101";
        WAIT FOR 200ns;

        A <= "011";
        WAIT FOR 200ns;

        A <= "001";
        WAIT FOR 200ns;
        
        A <= "100";
        WAIT FOR 200ns; 

        A <= "110";
        WAIT; 
                        
end process;

end Behavioral;
