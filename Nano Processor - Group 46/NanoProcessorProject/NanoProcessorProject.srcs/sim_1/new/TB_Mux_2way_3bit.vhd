----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 12:56:29 AM
-- Design Name: 
-- Module Name: TB_Mux_2way_3bit - Behavioral
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

entity TB_Mux_2way_3bit is
--  Port ( );
end TB_Mux_2way_3bit;

architecture Behavioral of TB_Mux_2way_3bit is

component MUX_2_way_3_Bit
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
       I1 : in STD_LOGIC_VECTOR (2 downto 0);
       S : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal I0,I1,Q : STD_LOGIC_VECTOR(2 downto 0);
signal S : STD_LOGIC;

begin
UUT: MUX_2_way_3_Bit
Port Map(
    I0 => I0,
    I1 => I1,
    S => S,
    Q => Q
    );

process 

begin
    I0 <= "110";
    I1 <= "011";
    S <= '0';
    WAIT FOR 250ns;
    
    S <= '1';
    WAIT FOR 250ns;
 
    I0 <= "101";
    I1 <= "001";
    S <= '0';
    WAIT FOR 250ns; 
    
    I0 <= "100";
    I1 <= "111";
    S <= '1';
    WAIT FOR 250ns;  
    
    S <= '1';
    WAIT;

end process;
end Behavioral;
