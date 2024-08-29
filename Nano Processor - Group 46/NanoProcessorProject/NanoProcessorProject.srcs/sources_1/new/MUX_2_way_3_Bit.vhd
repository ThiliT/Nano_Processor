----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 12:24:22 AM
-- Design Name: 
-- Module Name: MUX_2_way_3_Bit - Behavioral
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

entity MUX_2_way_3_Bit is
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_way_3_Bit;

architecture Behavioral of MUX_2_way_3_Bit is

begin
    process(I0,I1,S)
    begin
        case S is
            when '0' => Q <= I0;
            when '1' => Q <= I1; 
            when others => Q <= "ZZZ";
        end case;
     end process;
end Behavioral;
