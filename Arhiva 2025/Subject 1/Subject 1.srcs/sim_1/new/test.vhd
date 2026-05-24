----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2026 05:59:52 PM
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
--  Port ( );
end test;

architecture Behavioral of test is
    component Top_lvl_ROM_CNT is
    port(CLK : in STD_LOGIC;
         RST : in STD_LOGIC;
         Q_out_rom : out STD_LOGIC_VECTOR(3 downto 0) 
         );
    end component;
    
    signal CLK , RST : STD_LOGIC;
    signal Q_out_rom : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    UUT : Top_lvl_ROM_CNT port map(
        CLK => CLK,
        RST => RST,
        Q_out_rom => Q_out_rom
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
            RST <='1';
            wait for 5ns;
            RST <='0';
            wait for 5ns;
            
            wait;
    end process;
    
end Behavioral;
