----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2026 12:56:33 PM
-- Design Name: 
-- Module Name: Conv_bin - Behavioral
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

entity Conv_bin is
    port ( Data_in : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR(3 downto 0)
           );
end Conv_bin;

architecture Behavioral of Conv_bin is
    
begin
    process(Data_in)
        begin
           if(Data_in ='0') then
             Data_out <= "0000";
           else
             Data_out <="0001";
           end if;
    end process;
    

end Behavioral;
