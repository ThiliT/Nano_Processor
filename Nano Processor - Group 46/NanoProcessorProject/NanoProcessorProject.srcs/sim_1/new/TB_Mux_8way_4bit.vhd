----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 11:45:38 AM
-- Design Name: 
-- Module Name: TB_Mux_8way_4bit - Behavioral
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

entity TB_Mux_8way_4bit is
--  Port ( );
end TB_Mux_8way_4bit;

architecture Behavioral of TB_Mux_8way_4bit is
component MUX_8_way_4_Bit
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
       R1 : in STD_LOGIC_VECTOR (3 downto 0);
       R2 : in STD_LOGIC_VECTOR (3 downto 0);
       R3 : in STD_LOGIC_VECTOR (3 downto 0);
       R4 : in STD_LOGIC_VECTOR (3 downto 0);
       R5 : in STD_LOGIC_VECTOR (3 downto 0);
       R6 : in STD_LOGIC_VECTOR (3 downto 0);
       R7 : in STD_LOGIC_VECTOR (3 downto 0);
       S : in STD_LOGIC_VECTOR (2 downto 0);
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

signal R0, R1, R2, R3, R4, R5, R6, R7, Q : STD_LOGIC_VECTOR( 3 downto 0);
signal S : STD_LOGIC_VECTOR(2 downto 0);
begin
UUT: MUX_8_way_4_Bit
Port Map(
     R0 => R0,
     R1 =>  R1,
     R2 =>  R2,
     R3 =>  R3,
     R4 =>  R4,
     R5 =>  R5,
     R6 =>  R6,
     R7 =>  R7,
     S  =>  S ,
     Q  =>  Q );

process 
    begin
        R0 <= "1100";
        R1 <= "1001";
        R2 <= "0011";
        R3 <= "0110";
        R4 <= "1101";
        R5 <= "1010";
        R6 <= "0100";
        R7 <= "1001";   
        S  <= "001";
        WAIT FOR 500ns;
        
        R0 <= "1100";
        R1 <= "1101";
        R2 <= "1011";
        R3 <= "0011";
        R4 <= "1100";
        R5 <= "1001";
        R6 <= "0110";
        R7 <= "1101";   
        S  <= "011";
        WAIT;        
end process;
end Behavioral;
