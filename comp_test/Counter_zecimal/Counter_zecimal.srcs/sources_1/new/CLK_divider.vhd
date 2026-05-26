----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2026 12:48:30 AM
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
    generic( Period : natural := 1000);
    port (CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Clk_out : out STD_LOGIC );
end CLK_divider;

architecture Behavioral of CLK_divider is
    
    constant PER : natural := Period * 50_000;
    signal CLK_AUX : STD_LOGIC := '0';
    signal count : natural := 1;
begin
    Clk_out <= CLK_AUX;
    process(CLK,RST)
        begin
            if ( RST ='1' ) then
                Count <= 1;
                CLK_AUX <= '0';
            elsif (rising_edge(CLk)) then
                if( Count = PER ) then
                    Count <= 1;
                    Clk_aux <= not CLk_aux;
                else
                    Count <= Count + 1;
                end if;
            end if;
    end process;

end Behavioral;
