----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/10/2023 10:32:31 PM
-- Design Name: 
-- Module Name: TB_SevenSeg_LUT - Behavioral
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

entity TB_SevenSeg_LUT is
--  Port ( );
end TB_SevenSeg_LUT;

architecture Behavioral of TB_SevenSeg_LUT is
component SevenSeg_LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal address : STD_LOGIC_VECTOR (3 downto 0);
signal data : STD_LOGIC_VECTOR (6 downto 0);

begin
UUT : SevenSeg_LUT_16_7
    port map (
      address => address,
      data    => data
);   

process

begin
    address <= "1100";
    WAIT FOR 250 ns;
    
    address<= "1101";    
    WAIT FOR 250 ns; 
    
    address<= "0011"; 
    WAIT FOR 250 ns; 
    
    address<= "1011";       
    WAIT; 
    
end process;     

end Behavioral;
