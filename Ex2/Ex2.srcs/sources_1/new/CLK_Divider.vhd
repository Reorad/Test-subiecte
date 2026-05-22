----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2026 05:15:50 PM
-- Design Name: 
-- Module Name: CLK_Divider - Behavioral
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

entity CLK_Divider is
    generic( Period : natural := 1000 );
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Clk_slow : out STD_LOGIC
          );
end CLK_Divider;

architecture Behavioral of CLK_Divider is
    signal Clk_aux : STD_LOGIC :='0';
    signal Count : natural := 0 ;
    constant Half_clk : natural := 50000;
begin
    process(CLK,RST)
        begin
            if(RST ='1') then
                Count <= 0;
                Clk_aux <= '0';
            elsif ( rising_edge(clk) ) then
                if(count = Period * Half_clk ) then
                    Count <= 0;
                    Clk_aux <= not Clk_aux;
                else
                    Count <= Count + 1;
                end if;
            end if;
    end process;
    Clk_slow <= Clk_aux;
end Behavioral;
