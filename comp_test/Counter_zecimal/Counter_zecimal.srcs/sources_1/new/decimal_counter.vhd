----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2026 12:15:51 AM
-- Design Name: 
-- Module Name: decimal_counter - Behavioral
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

entity decimal_counter is
    port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Up_c  : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Q_out : out STD_LOGIC_VECTOR(3 downto 0)
           );
end decimal_counter;

architecture Behavioral of decimal_counter is
    signal Q_int : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin

    Cout <= '1' when Q_int = "1001" else '0';
    Q_out <= Q_int;
    
    process(CLK,RST)
        begin
            if(RST ='1') then
               Q_int <= (others => '0');
            elsif(rising_edge(CLK)) then
                if(Up_c = '1' ) then
                    if(Q_int = "1001" ) then
                        Q_int <= (others => '0');
                    else
                        Q_int <= Q_int + 1;
                    end if;
               end if;
           end if;
    end process;

end Behavioral;
