
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Detect_component is
    port( A : in STD_LOGIC_VECTOR(3 downto 0);
          En : out STD_LOGIC
          );
end Detect_component;

architecture Behavioral of Detect_component is

begin
    process(A)
        begin
            if(A = "1011") then
                En <= '1';
            else
                En <= '0';
            end if;
    end process;

end Behavioral;
