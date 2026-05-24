
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

entity bit_3counter is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(2 downto 0)
          );
end bit_3counter;

architecture Behavioral of bit_3counter is
    signal Q_cnt : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');  
begin
    Q_out <= Q_cnt;
    process(RST,CLK)
        begin
            if(RST ='1') then
                Q_cnt <= (others =>'0');
            elsif(rising_edge(CLK)) then
                Q_cnt <= Q_cnt + 1;
            end if;
    end process;

end Behavioral;
