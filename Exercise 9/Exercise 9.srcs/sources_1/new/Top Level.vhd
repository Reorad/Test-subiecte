----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2026 01:19:25 PM
-- Design Name: 
-- Module Name: Top Level - Behavioral
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

entity Top_Level is
    port(
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        Sel : in STD_LOGIC_VECTOR(1 downto 0);
        Add_in : in STD_LOGIC_VECTOR(2 downto 0);
        CLK : in STD_LOGIC;
        We : in STD_LOGIC;
       
        RST : in STD_LOGIC;
        CNT_BTN : in STD_LOGIC;
        Leds_data_out : out STD_LOGIC_VECTOR(3 downto 0);
        Cathodes : out STD_LOGIC_VECTOR(7 downto 0);
        Anodes : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Top_Level;

architecture Behavioral of Top_Level is
    
    component Alu_4bits_RAM is
    port( ADD : in STD_LOGIC_VECTOR(2 downto 0);
          RST : in STD_LOGIC;
          CLK : in STD_LOGIC;
          A : in STD_LOGIC_VECTOR(3 downto 0);
          B : in STD_LOGIC_VECTOR(3 downto 0);
          SEL : in STD_LOGIC_VECTOR(1 downto 0);
          We : in STD_LOGIC;
          
          Mem_out : out STD_LOGIC_VECTOR(3 downto 0)
          
          );
    end component;
    
    
    component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
    end component;
    
    component SSD_DRIVER is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Data : in STD_LOGIC_VECTOR(15 downto 0); -- 15 biti ca printezi binar numarul pe 4 anozi --
          
          
          Cathodes : out STD_LOGIC_VECTOR(7 downto 0);
          Anodes : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    signal RAM_Data : STD_LOGIC_VECTOR(3 downto 0);
    signal Binary_Data_padded:  STD_LOGIC_VECTOR(15 downto 0);
    signal CNT_BTN_out : STD_LOGIC;
    
    
begin
    Leds_data_out <= RAM_Data;
    
    Btn_clk : MPG port map(
        CLK=>CLK,
        btn => CNT_BTN,
        en => CNT_BTN_out
    ); 
    
    Ram_top_comp : Alu_4bits_RAM port map(
        A => A,
        B => B,
        Sel => Sel,
        ADD => Add_in,
        RST => RST,
        CLK => CNT_BTN_out,
        We => We,
        Mem_out => RAM_Data 
    );
    
    Binary_Data_padded(3 downto 0) <= "000" & RAM_Data(0); 
    Binary_Data_padded(7 downto 4) <= "000" & RAM_Data(1);
    Binary_Data_padded(11 downto 8) <= "000" & RAM_Data(2);
    Binary_Data_padded(15 downto 12) <= "000" & RAM_Data(3);
    
    Printer : SSD_DRIVER port map(
        CLK => CLK ,
        DATA => Binary_Data_padded,
        RST => RST,
        Cathodes => Cathodes,
        Anodes => Anodes
    );
    
end Behavioral;
