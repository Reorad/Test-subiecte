----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2026 03:04:30 PM
-- Design Name: 
-- Module Name: Clk_divider - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clk_divider is
    generic ( Perioada : Natural := 1000) ;
    port( RST : in STD_LOGIC;
          CLK : in STD_LOGIC;
          Clk_out : out STD_LOGIC
          );
end Clk_divider;

architecture Behavioral of Clk_divider is
    constant Per : natural := 50000;
    signal Q_aux : STD_LOGIC := '0';
    signal Count : natural := 0;
begin
    process(CLK, RST)
        begin
            if(RST ='1') then
               Q_aux <='0';
               Count <= 0;
            elsif(rising_edge(Clk)) then    
                if(count = PER * Perioada ) then
                    Q_aux <= not Q_aux;
                    Count <= 0;
                else
                    Count <= Count + 1 ;
                end if;
            end if;
    end process;
    Clk_out <= Q_aux;
end Behavioral;
