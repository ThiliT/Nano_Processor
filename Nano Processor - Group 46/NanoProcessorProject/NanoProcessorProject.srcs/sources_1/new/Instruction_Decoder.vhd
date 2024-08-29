----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 11:57:31 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
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
           
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is


begin

    
process(Instruction, Reg_Chk_Jmp)
    begin
    
    Reg_en <= "000";
    Load_sel <= '0';
    Imm_Val <= "0000";
    Reg_Sel_A <= "000";
    Reg_Sel_B <= "000";
    Add_Sub_Sel <= '0';
    Jump_add <= "000";
    Jump_flag <= '0';
    
          
    If (Instruction(11)='0' and Instruction(10)='0') then    --ADD 
        Reg_en <= Instruction (9 downto 7);
        Load_sel <= '0';
        Reg_Sel_A <= Instruction (9 downto 7);
        Reg_Sel_B <= Instruction (6 downto 4);
        Add_Sub_Sel <= '0';
             
    elsIf (Instruction(11)='0' and Instruction(10)='1') then --NEG
           Reg_en <= Instruction(9 downto 7);
           Load_sel <= '0';
           Reg_Sel_A <= "000";
           Reg_Sel_B <= Instruction (9 downto 7);
           Add_Sub_Sel <= '1';

                
     elsIf (Instruction(11)='1' and Instruction(10)='0') then --MOVI
              Reg_en <= Instruction(9 downto 7);
              Load_sel <= '1';
              Imm_Val <= Instruction(3 downto 0);

                   
     elsIf (Instruction(11)='1' and Instruction(10)='1') then --JUMP
            Reg_en <= "000";
            Reg_Sel_A <= Instruction (9 downto 7);
           if (Reg_Chk_Jmp = "0000") then
               Jump_flag <= '1';
               Jump_add <= Instruction(2 downto 0);
               
           else
               Jump_flag <= '0';
           end if; 

    end if;
    
end process;
end Behavioral;
