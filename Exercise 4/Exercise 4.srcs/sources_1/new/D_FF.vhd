----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2026 12:05:39 PM
-- Design Name: 
-- Module Name: D_FF - Behavioral
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

entity D_FF is
    port( CLK : in STD_LOGIC;
          D : in STD_LOGIC;
          RST : in STD_LOGIC;
          Q_out : out STD_LOGIC );
end D_FF;

architecture Behavioral of D_FF is
    signal Q_aux : STD_LOGIC;
begin
    Q_out <= Q_aux;
    process(CLK, RST)
        begin 
            if( RST ='1' ) then
                Q_aux <= '0';
            elsif (rising_edge(CLK) ) then
                Q_aux <= D;
            end if;   
    end process;

end Behavioral;
