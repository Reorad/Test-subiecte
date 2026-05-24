----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2026 08:28:25 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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

entity ROM is
    port (Add : in STD_LOGIC_VECTOR(1 downto 0);
          Mem_out : out STD_LOGIC_VECTOR(15 downto 0)
          );
end ROM;

architecture Behavioral of ROM is
    
    type Mem_type is Array(0 to 3) of STD_LOGIC_VECTOR(15 downto 0);
    signal MEM_ROM : Mem_type := (
        0 => x"000F",
        1 => x"0002",
        2 => x"000C",
        3 => x"000D"
        );
begin
    
    Mem_out <= MEM_ROM(to_integer(unsigned(Add)));

end Behavioral;
