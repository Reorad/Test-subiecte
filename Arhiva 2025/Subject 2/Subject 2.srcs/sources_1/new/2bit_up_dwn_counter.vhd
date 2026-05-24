----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2026 08:28:25 PM
-- Design Name: 
-- Module Name: 2bit_up_dwn_counter - Behavioral
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

entity bit2_up_dwn_counter is
    port( CLK : in STD_LOGIC;
          Up : in STD_LOGIC;
          Down : in STD_LOGIC;
          RST : in STD_LOGIC;
          Q_out : out STD_LOGIC_vECTOR(1 downto 0)
          );
end bit2_up_dwn_counter;

architecture Behavioral of bit2_up_dwn_counter is
    signal Q_int : STD_LOGIC_VECTOR(1 downto 0);
begin
    process(CLK,RST)
        begin
            if(RST ='1') then
                Q_int <= (others => '0');
            elsif(rising_edge(CLK)) then
                if(Up = '1') then
                    Q_int <= Q_int + 1;
                elsif (Down ='1') then
                    Q_int <= Q_int - 1;
                end if;
            end if;
    end process;
    Q_out <= Q_int;
end Behavioral;
