----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:34:58 AM
-- Design Name: 
-- Module Name: TB_NanoProcessor - Behavioral
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

entity TB_Nanoprocessor is
--  Port ( );
end TB_Nanoprocessor;

architecture Behavioral of TB_Nanoprocessor is

component Nanoprocessor
    Port ( Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC;
       R7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Reset, Overflow, Zero : STD_LOGIC;
signal Clk : STD_LOGIC := '0';
signal R7 : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT: NanoProcessor PORT MAP(
    Clk => Clk,
    Reset => Reset,
    Overflow => Overflow,
    Zero => Zero,
    R7 => R7
);


process
    begin
    wait for 1ns;
    Clk <= NOT(Clk);
end process;


process 
begin

Reset <= '1';
wait for 100 ns;

Reset <= '0';
wait;
end process;


end Behavioral;
