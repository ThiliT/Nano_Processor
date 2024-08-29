----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 12:31:23 AM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R7 : out STD_LOGIC_VECTOR (3 downto 0);
           Seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0);       
           an : out STD_LOGIC_VECTOR (3 downto 0)
           );
end NanoProcessor;

architecture Behavioral of NanoProcessor is


component SevenSeg_LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

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

component Program_Rom is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Program_Counter 
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Add_Sub_Unit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;  --sel=0 ADD , sel=1 SUBSTRACT
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_Out : out STD_LOGIC; -- Carry flag
           Z_Out : out STD_LOGIC; -- Zero flag
           Overflow : out STD_LOGIC );   --Overflow flag     
end component;

component Adder_3_Bit 
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

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

component MUX_2_way_4_Bit is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_2_way_3_Bit 
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;


signal Imd_Value, Reg_Check, ASU_Out, Reg_Bank_Input, Data_bus_0, Data_bus_1, Data_bus_2, Data_bus_3, Data_bus_4, Data_bus_5, Data_bus_6, Data_bus_7: STD_LOGIC_VECTOR(3 downto 0);
signal Inst_Bus : STD_LOGIC_VECTOR(11 downto 0);
signal Reg_en, Mem_Sel, Reg_Sel_A , Reg_Sel_B, Mux_to_PC, Adder_3_bit_out, Jmp_Address: STD_LOGIC_VECTOR (2 downto 0);
signal AS_Sel, Load_Select, Jump_Flag: STD_LOGIC;
signal Slow_Clk_out: STD_LOGIC;

signal Mux_A_out , Mux_B_out :std_logic_vector(3 downto 0);
signal Carry_Flag, Zero_Flag,Overflow_Flag: std_logic;

begin


SevenSeg_LUT_16_7_0 : SevenSeg_LUT_16_7
port map(
    address => Data_bus_7,
    data => Seven_seg_out);

Slow_Clk_0 : Slow_Clk         
port map (
    Clk_in => Clk,
    Clk_out => Slow_Clk_out);
    
Reg_Bank_0 : Reg_Bank
    port map (
          Reg_en => Reg_en,
          Clk => Slow_Clk_out,
          Reset => Reset,
          D => Reg_Bank_Input,
          R0 => Data_bus_0,
          R1 => Data_bus_1,
          R2 => Data_bus_2,
          R3 => Data_bus_3,
          R4 => Data_bus_4,
          R5 => Data_bus_5,
          R6 => Data_bus_6,
          R7 => Data_bus_7 );
 
Instruction_Decoder_0 : Instruction_Decoder
          port map (
              Instruction => Inst_Bus,
              Reg_en => Reg_en,
              Load_sel => Load_Select,
              Imm_Val => Imd_Value,
              Reg_Sel_A => Reg_Sel_A,
              Reg_Sel_B => Reg_Sel_B,
              Add_Sub_Sel => AS_Sel,
              Jump_add => Jmp_Address,
              Jump_flag => Jump_Flag,
              Reg_Chk_Jmp => Reg_Check);
                        
Program_Rom_0 :Program_Rom
port map (
    address => Mem_Sel,    
    data => Inst_Bus);

Program_Counter_0  : Program_Counter 
port map (
    D => Mux_to_PC,
    Reset => Reset,
    Clk => Slow_Clk_out,
    Q => Mem_Sel);

Reg_Check <= Mux_A_out;
      
 Add_Sub_Unit_0 : Add_Sub_Unit
 port map( 
     A => Mux_A_out, 
     B => Mux_B_out,  
     Sel => AS_Sel,  
     S =>  ASU_Out,
     C_Out => Carry_Flag, 
     Z_Out => Zero_Flag,
     Overflow => Overflow_Flag  
     );
     
Adder_3_Bit_0  : Adder_3_Bit 
     port map (
         A => Mem_Sel,
         C_in => '0',
         S => Adder_3_bit_out);           

MUX_8_way_4_Bit_A :  MUX_8_way_4_Bit 
port map (
           R0 => Data_bus_0, 
           R1 => Data_bus_1,
           R2 => Data_bus_2,
           R3 => Data_bus_3,
           R4 => Data_bus_4,
           R5 => Data_bus_5,
           R6 => Data_bus_6,
           R7 => Data_bus_7,
           S => Reg_Sel_A,
           Q => Mux_A_out ); 
  
MUX_8_way_4_Bit_B :  MUX_8_way_4_Bit 
port map (
          R0 => Data_bus_0, 
          R1 => Data_bus_1,
          R2 => Data_bus_2,
          R3 => Data_bus_3,
          R4 => Data_bus_4,
          R5 => Data_bus_5,
          R6 => Data_bus_6,
          R7 => Data_bus_7,
          S => Reg_Sel_B,
          Q => Mux_B_out );    
      
Mux_2_way_4_Bit_0 : Mux_2_way_4_Bit
          port map (
                S => Load_Select,
                I0 => ASU_Out,
                I1 => Imd_Value,
                Q => Reg_Bank_Input);
                    
MUX_2_way_3_Bit_0 : MUX_2_way_3_Bit
port map (
    S => Jump_Flag,
    I0 => Adder_3_bit_out,
    I1 => Jmp_Address,
    Q => Mux_to_PC);
 
Zero <= Zero_Flag;
Overflow <= Overflow_Flag;
R7 <= Data_bus_7;

an <= "1110";

end Behavioral;
