
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

entity counter is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
end counter;

architecture Behavioral of counter is
    
    signal Q_internal : STD_LOGIC_VECTOR(3 downto 0);
    
    
begin
    process(CLK,RST)
        BEGIN
            if (RST ='1' ) then
                Q_internal <= (others => '0');
            elsif (rising_edge(CLK)) then
                Q_internal <= Q_internal + 1;
            end if;
    end process;
    Q_out <= Q_internal;
end Behavioral;
