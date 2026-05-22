
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLK_Div is
    generic ( per : natural := 1000 ); 
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        CLK_aux : out STD_LOGIC
    );
end CLK_Div;

architecture Behavioral of CLK_Div is
    signal Q_aux_clk : STD_LOGIC := '0';
    constant PERIOD : natural := 50_000;
    signal COUNT : natural := 0;
    
    
begin
    Clk_aux <= Q_aux_clk;
    process(CLK,RST)
        begin
            if( RST = '1') then
                COUNT <= 0;
                Q_aux_clk <= '0';
            elsif(rising_edge(CLK)) then
                if(COUNT = PER * PERIOD) then
                    Count <= 0;
                    Q_aux_clk <= not Q_aux_clk;
                else
                    Count <= Count + 1;
                end if;
            end if;
    end process;

end Behavioral;
