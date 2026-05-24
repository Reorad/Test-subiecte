
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

entity counter_4_bits is
    port(
        CLK : in STD_LOGIC;
--        Clk_slow : in STD_LOGIC;
        Load : in STD_LOGIC;
        Rst : in STD_LOGIC;
        Val_load : in STD_LOGIC_VECTOR(3 downto 0);
        Disable_load : out STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
end counter_4_bits;

architecture Behavioral of counter_4_bits is

    signal Count_aux : STD_LOGIC_VECTOR(3 downto 0) :=(others =>'0');

begin
    Q_out <= Count_aux;
    process(CLK,RST)
        begin
            if( RST ='1') then
                Count_aux <= (others =>'0');
                Disable_load <= '0';
            elsif (rising_edge(Clk)) then
                if(Load = '1' ) then
                    Count_aux <= Val_load ;
                    Disable_load <= '1';
                else
                    Disable_load <= '0';
                    Count_aux <= Count_aux + 1;
                end if;
            end if;
    end process;

end Behavioral;
