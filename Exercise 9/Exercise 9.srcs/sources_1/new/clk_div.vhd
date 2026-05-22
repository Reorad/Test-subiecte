----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2026 11:15:12 AM
-- Design Name: 
-- Module Name: clk_div - Behavioral
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

entity clk_div is
    generic ( per : natural := 1000);
    port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        CLk_out : out STD_LOGIC
    );
end clk_div;
    
architecture Behavioral of clk_div is
    constant PERIOD : natural := 50_000;
    signal Q_clk : STD_LOGIC := '0';
    signal Count : natural := 0;
    
begin   
    Clk_out <= Q_clk;
    process(CLK,RST)
        begin
        if( RST = '1') then
            Q_clk <= '0';
            Count <= 0;
        elsif (rising_edge(CLK)) then
            if(Count = PER * PERIOD ) then
                Count <= 0;
                Q_clk <= not Q_clk;
            else
                Count <= Count + 1;
            end if;
        end if;
     end process;
end Behavioral;
