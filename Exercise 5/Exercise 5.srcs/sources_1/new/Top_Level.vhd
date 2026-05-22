----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2026 05:30:00 PM
-- Design Name: 
-- Module Name: Top_Level - Behavioral
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
        CLK : in STD_LOGIC;
        Load : in STD_LOGIC;
        RST : in STD_LOGIC;
        Leds_out_counter : out STD_LOGIC_VECTOR(3 downto 0);
        Leds_out_register : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Top_Level;

architecture Behavioral of Top_Level is
    
    component Counter_Reg is
    port( CLK : in STD_LOGIC;
          Rst : in STD_LOGIC;
          Load : in STD_LOGIC;
          Q_leds_counter : out STD_LOGIC_VECTOR(3 downto 0);
          Q_leds_Register : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    component CLK_divider is
    generic (Period : natural := 1000);
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          CLk_slow : out std_logic
          );
    end component;
    
    signal Sec_1clk : STD_LOGIC;
    
    
begin

    Smaller_CLK : CLK_divider 
    generic map(1000)
    port map(
        CLK => CLK,
        RST => RST,
        Clk_slow => Sec_1clk
    );
    
    Counter_register : Counter_Reg port map(
        CLK => Sec_1clk ,
        RST => RST,
        Load => Load,
        Q_leds_counter => Leds_out_counter,
        Q_leds_Register => Leds_out_register
    );
    
        
end Behavioral;
