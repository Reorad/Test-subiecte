
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Comparator_16bit is
    port( A : in  STD_LOGIC_VECTOR(15 downto 0);
          B : in  STD_LOGIC_VECTOR(15 downto 0);
          O : out STD_LOGIC_VECTOR(2 downto 0)  -- We 001 -> < ; 010 - = ; 100 - = >
          );
end Comparator_16bit;

architecture Behavioral of Comparator_16bit is
    
  
    
begin
     process(A,B)
        begin
            if ( (to_integer(unsigned(A))) < (to_integer(unsigned(B))) ) then
                O <= "001";
            elsif ( (to_integer(unsigned(A))) = (to_integer(unsigned(B))) )  then
                O <= "010";
            else
                O <= "100";
            end if;         
     end process;

end Behavioral;
