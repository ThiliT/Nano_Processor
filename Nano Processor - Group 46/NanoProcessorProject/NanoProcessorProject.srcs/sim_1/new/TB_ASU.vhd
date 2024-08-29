----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 08:43:53 AM
-- Design Name: 
-- Module Name: TB_ASU - Behavioral
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

entity TB_ASU is
--  Port ( );
end TB_ASU;

architecture Behavioral of TB_ASU is
component ADD_Sub_Unit 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC; --sel=0 ADD , sel=1 SUBSTRACT
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_Out : out STD_LOGIC;
           Z_Out : out STD_LOGIC;
           Overflow : out STD_LOGIC 
        );
end component;

signal A,B,S: STD_LOGIC_VECTOR(3 downto 0);
signal Sel, C_Out, Z_Out, Overflow : STD_LOGIC ;

begin
    UUT: Add_Sub_Unit
    Port Map(
    A => A,
    B => B,
    Sel => Sel,
    S => S,
    C_Out => C_Out,
    Z_Out => Z_Out,
    Overflow => Overflow );
    
process
begin

A <= "1111";
B <= "1110";
Sel <= '0';
wait for 200ns;

A <= "1110";
B <= "1111";
Sel <= '1';
wait for 200ns;

A <= "1100";
B <= "1000";
Sel <= '1';
wait for 200ns;

A <= "0100";
B <= "0011";
Sel <= '0';
wait for 200ns;

A <= "0110";
B <= "0011";
Sel <= '0';
wait;

end process; 

end Behavioral;
