----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 08:29:56 AM
-- Design Name: 
-- Module Name: TB_Reg_Bank - Behavioral
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

entity TB_Reg_Bank is
--  Port ( );
end TB_Reg_Bank;

architecture Behavioral of TB_Reg_Bank is
component Reg_Bank
    Port ( Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Reg_en : STD_LOGIC_VECTOR (2 downto 0);
signal Clk : STD_LOGIC := '0';
signal Reset : STD_LOGIC;
signal Input_D : STD_LOGIC_VECTOR (3 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7 : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT: Reg_Bank
Port Map(
    Reg_en => Reg_en,
    Clk => Clk,
    Reset => Reset,
    D => Input_D,
    R0 => R0,
    R1 => R1,
    R2 => R2,
    R3 => R3,
    R4 => R4,
    R5 => R5,
    R6 => R6,
    R7 => R7 );


process
    begin
    wait for 10ns;
    Clk <= NOT(Clk);
end process;
    
process
begin

		Input_D <= "1111";
		Reset <= '0';
        Reg_En <= "100";
		WAIT FOR 100 ns;
		
		Reg_En <= "001";
		WAIT FOR 100 ns;
		
		Reg_En <= "010";
		WAIT FOR 100 ns;
		
		Reg_En <= "101";
		WAIT FOR 100 ns;
		
		Reg_En <= "111";
		WAIT FOR 100 ns;
		
		Reg_En <= "011";
		WAIT FOR 100 ns;
		
		Reg_En <= "110";
		WAIT FOR 100 ns;
		
		Reset <='1';
        WAIT FOR 100ns;

        Input_D <="0110";
        Reg_En <="001";
        Reset <='0';
        WAIT;
        
end process;

end behavioral;