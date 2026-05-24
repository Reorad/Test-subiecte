----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2026 08:39:38 PM
-- Design Name: 
-- Module Name: Top_Level_a - Behavioral
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

entity Top_Level_a is
    port (CLK : in STD_LOGIC;
          Btn_up : in STD_LOGIC;
          Btn_dw : in STD_LOGIC;
          RST : in STD_LOGIC;
          Leds_out : out STD_LOGIC_VECTOR(15 downto 0)
          );
end Top_Level_a;

architecture Behavioral of Top_Level_a is
    
    component Top_Level_CNT_ROM is
    port( CLK : in STD_LOGIC;
          Up : in STD_LOGIC;
          Down : in STD_LOGIC;
          RST : in STD_LOGIC;
          Data_out : out STD_LOGIC_VECTOR(15 downto 0)
          );
    end component;
    
    component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
    end component;
    
    signal Btn_down_out : STD_LOGIC;
    signal Btn_up_out : STD_LOGIC;
    
begin

    Cnt : Top_Level_CNT_ROM port map(
        CLK => CLK,
        Down => Btn_down_out,
        Up => Btn_up_out,
        RST => RST,
        Data_out => Leds_out 
        );
        
     Dwn_btn_comp : MPG port map(
        btn => Btn_dw,
        CLk => CLK,
        en => Btn_down_out
     );
     
     
     Up_btn_comp : MPG port map(
        btn => Btn_up,
        CLk => CLK,
        en => Btn_up_out
     
     );
     
end Behavioral; 
