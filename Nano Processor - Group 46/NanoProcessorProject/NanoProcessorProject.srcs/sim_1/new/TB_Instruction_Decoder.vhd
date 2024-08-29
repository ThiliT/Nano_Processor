----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/10/2023 11:12:05 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
component Instruction_Decoder
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
       Reg_en : out STD_LOGIC_VECTOR (2 downto 0);
       Load_sel : out STD_LOGIC;
       Imm_Val : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
       Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
       Add_Sub_Sel : out STD_LOGIC;
       Jump_add : out STD_LOGIC_VECTOR (2 downto 0);
       Jump_flag : out STD_LOGIC;
       Reg_Chk_Jmp : in STD_LOGIC_VECTOR (3 downto 0));
       
end component;

signal Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal Reg_en : STD_LOGIC_VECTOR (2 downto 0);
signal Load_sel : STD_LOGIC;
signal Imm_Val : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_Sel_A : STD_LOGIC_VECTOR (2 downto 0);
signal Reg_Sel_B : STD_LOGIC_VECTOR (2 downto 0);
signal Add_Sub_Sel : STD_LOGIC;
signal Jump_add : STD_LOGIC_VECTOR (2 downto 0);
signal Jump_flag : STD_LOGIC;
signal Reg_Chk_Jmp : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT: Instruction_Decoder
PORT MAP(
    Instruction => Instruction,
    Reg_en => Reg_en,
    Load_sel => Load_sel,
    Imm_Val => Imm_Val,
    Reg_Sel_A => Reg_Sel_A,
    Reg_Sel_B => Reg_Sel_B,
    Add_Sub_Sel => Add_Sub_Sel,
    Jump_add => Jump_add,
    Jump_flag => Jump_flag,
    Reg_Chk_Jmp => Reg_Chk_Jmp );

--210159G => 110011010011101111
--210636R => 110011011011001100
   
process
    begin
        Instruction <= "111101110010";
        Reg_Chk_Jmp <= "1100";
        WAIT FOR 500ns;

        Instruction <= "001100110110";
        Reg_Chk_Jmp <= "1111";
        WAIT;
        
end process;
    
end Behavioral;
