
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

entity bit4_register is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Load : in STD_LOGIC;
          S_in : in STD_LOGIC;
          Load_val : in STD_LOGIC_VECTOR(3 downto 0);
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
end bit4_register;

architecture Behavioral of bit4_register is
    signal Q_int : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    Q_out <= Q_int;
    process(CLK,RST)
        begin
            if(RST ='1' ) then
                Q_int <= (others =>'0');
            elsif (rising_edge(clk)) then
                if(Load ='1') then
                    Q_int <= Load_val;
                else
                    Q_int <= Q_int(2 downto 0) & S_in;
                end if;
            end if;
    end process;

end Behavioral;
