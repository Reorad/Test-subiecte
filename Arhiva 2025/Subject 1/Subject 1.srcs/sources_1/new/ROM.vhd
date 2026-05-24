
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity ROM is
    port(
        Add : in STD_LOGIC_VECTOR(2 downto 0);
        Memory_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
end ROM;

architecture Behavioral of ROM is
   type Mem_type is array (0 to 7) of STD_LOGIC_VECTOR(3 downto 0);
   signal ROM_mem : Mem_type :=(
        0 =>  "0000",
        1 =>  "0001",
        2 =>  "1010",
        3 =>  "1011",
        4 =>  "0010",
        5 =>  "0111",
        6 =>  "1111",
        7 =>  "0000"
   );
begin
    Memory_out <= ROM_mem(to_integer(unsigned(Add)));

end Behavioral;
