----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2026 10:12:17 PM
-- Design Name: 
-- Module Name: Simulate_Count - Behavioral
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

entity Simulate_Count is
--  Port ( );
end Simulate_Count;

architecture Behavioral of Simulate_Count is
    
    component Cnt_Top is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Sel : in STD_LOGIC;
          Q_leds_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    signal CLK, RST, SEL : STD_LOGIC;
    signal Q_leds_out : STD_LOGIC_VECTOR(3 downto 0);
    
begin   
    
    UUT : Cnt_top port map(
        CLK => CLK,
        RST => RST,
        Sel => Sel,
        Q_leds_out => Q_leds_out
        ); 
        
    process
        begin
            CLK <= '0';
            wait for 5ns;
            CLK <= '1';
            wait for 5ns; 
    end process;     
        
    process
        begin
            RST <= '1';
            Sel <= '0';
            wait for 10ns;
            RST <= '0';
            wait for 50ns;
            Sel <= '1';
            wait for 10ns;
            
            
            wait;
    end process;
    
end Behavioral;
