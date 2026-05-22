
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
    port( Add_port : in STD_LOGIC_VECTOR(3 downto 0);
          Rom_data_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
end ROM;

architecture Behavioral of ROM is
    
    type mem_rom is array (0 to 15) of std_logic_vector(3 downto 0);
    signal Memory_func : Mem_rom :=
    (
        0  => "0100",  
        1  => "0001",  
        2  => "0011",  
        3  => "0101", 
        4  => "0000", 
        5  => "0000", 
        6  => "0111", 
        7  => "0001",  
        8  => "0100", 
        9  => "0010",  
        10 => "0010", 
        11 => "0111", 
        12 => "0000", 
        13 => "0010", 
        14 => "0110", 
        15 => "0010"    
    );
begin
    Rom_Data_out <= Memory_func(to_integer(unsigned( Add_port) ));
end Behavioral;
