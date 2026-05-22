----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2026 06:04:53 PM
-- Design Name: 
-- Module Name: Mux_4_1 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_4_1 is
    port ( I : in STD_LOGIC_VECTOR(3 downto 0);
           S : in STD_LOGIC_VECTOR(1 downto 0);
           O : out STD_LOGIC );
end Mux_4_1;

architecture Behavioral of Mux_4_1 is

begin
    
    O <= I(to_integer(unsigned(S)));

end Behavioral;
