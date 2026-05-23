
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clk_div is
    generic ( period : natural := 1000 );
    port(
        CLk : in STD_LOGIC;
        RST : in STD_LOGIC;
        Clk_out : out STD_LOGIC
    );
end Clk_div;

architecture Behavioral of Clk_div is
    signal Q_out : STD_LOGIC :='0';
    signal Count : natural := 0;
    constant PER : natural := 50_000;
begin
    process(CLK, RST)
        begin
            if(RST ='1') then
                Count <= 0;
                Q_out <= '0';
            elsif (rising_edge(CLK))then
                if(Count = PER * period) then
                    Count <= 0;
                    Q_out <= not Q_out;
                else
                    Count <= Count + 1;
                end if;
            end if;
    end process;
    Clk_out <= Q_out;

end Behavioral;
