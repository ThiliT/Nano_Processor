----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 01:08:56 AM
-- Design Name: 
-- Module Name: TB_Mux_2way_4bit - Behavioral
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

entity TB_Mux_2way_4bit is
--  Port ( );
end TB_Mux_2way_4bit;

architecture Behavioral of TB_Mux_2way_4bit is
component MUX_2_way_4_Bit
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
        I1 : in STD_LOGIC_VECTOR (3 downto 0);
       S : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Adder_Sub_Out, Imd_Value,Q : STD_LOGIC_VECTOR(3 downto 0);
signal S : STD_LOGIC;

begin
UUT: MUX_2_way_4_Bit
Port Map(
    I0 => Adder_Sub_Out,
    I1 =>  Imd_Value,
    S => S,
    Q => Q
    );

process 

begin
    Adder_Sub_Out <= "1100";
    Imd_Value <= "1101";
    S <= '0';
    WAIT FOR 200ns;
    
    S <= '1';
    WAIT FOR 200ns;
 
    Adder_Sub_Out <= "1011";
    Imd_Value <= "0011";
    S <= '0';
    WAIT FOR 200ns; 
    
    Adder_Sub_Out <= "0011";
    Imd_Value <= "1111";
    S <= '0';
    WAIT FOR 200ns;  
    
    S <= '1';
    WAIT;

end process;

end Behavioral;
