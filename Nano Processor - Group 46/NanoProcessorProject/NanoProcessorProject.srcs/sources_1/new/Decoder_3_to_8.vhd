----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 12:07:10 AM
-- Design Name: 
-- Module Name: Decoder_3_to_8 - Behavioral
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

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC := '1';
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is

begin

process (I)
begin
    if I = "000" then
        Y <= "00000001";
        
    elsif I = "001" then
        Y <= "00000010";
        
    elsif I = "010" then
        Y <= "00000100";
        
    elsif I = "011" then
        Y <= "00001000";
        
    elsif I = "100" then
        Y <= "00010000";
        
    elsif I = "101" then
        Y <= "00100000";
        
    elsif I = "110" then
        Y <= "01000000";
        
    else
        Y <= "10000000";
    end if;

end process;
  
end Behavioral;
