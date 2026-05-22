
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

entity bit4counter is
    port( RST : in STD_LOGIC;
          CLK : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
end bit4counter;

architecture Behavioral of bit4counter is

    signal Q_aux : STD_LOGIC_VECTOR(3 downto 0) := (others =>'0');
    
begin
    process(CLK,RST) 
        begin
            if( RST ='1' ) then
                Q_aux <= (others => '0' );
            elsif (rising_edge(CLK)) then
                Q_aux <= Q_aux + 1;
            end if;
    end process;
    Q_out <= Q_aux;
end Behavioral;
