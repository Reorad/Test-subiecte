----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2026 05:22:12 PM
-- Design Name: 
-- Module Name: CLK_divider - Behavioral
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

entity CLK_divider is
    generic (Period : natural := 1000);
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          CLk_slow : out std_logic
          );
end CLK_divider;

architecture Behavioral of CLK_divider is
    constant PER : natural := 50_000;
    signal Count : natural := 0;
    signal CLk_aux :STD_LOGIC := '0';
    
begin
    CLk_slow <= CLk_aux;
    process(CLK,RST)
        begin
            if(RST ='1') then
                Count <= 0;
                CLk_aux <= '0';
             elsif(rising_edge(CLK)) then
                if(Count = PER * Period) then
                    Count <= 0;
                    Clk_aux <= not CLK_aux; 
                else
                    Count <= Count + 1;
                end if;
             end if;
     end process;
end Behavioral;
