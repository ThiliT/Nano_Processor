----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 12:28:48 AM
-- Design Name: 
-- Module Name: Add_Sub_Unit - Behavioral
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

entity Add_Sub_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC; --sel=0 ADD , sel=1 SUBSTRACT
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_Out : out STD_LOGIC;
           Z_Out : out STD_LOGIC;
           Overflow : out STD_LOGIC 
            );
                    
end Add_Sub_Unit;

architecture Behavioral of Add_Sub_Unit is
component RCA_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           Overflow : out STD_LOGIC );
end component;

signal B_Sel, S_out  : STD_LOGIC_VECTOR (3 downto 0);

begin
B_Sel(0) <= B(0) XOR Sel;
B_Sel(1) <= B(1) XOR Sel;
B_Sel(2) <= B(2) XOR Sel;
B_Sel(3) <= B(3) XOR Sel;

RCA_4_0 : RCA_4
    port map (
        B => B_Sel,
        A => A,
        C_in => Sel,
        S => S_out,
        C_Out => C_Out,
        Overflow => Overflow);
        
S <= S_out;
Z_Out <= NOT (S_out(0) OR S_out(1) OR S_out(2) OR S_out(3));
        
end Behavioral;
