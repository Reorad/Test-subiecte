
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Clk_div is
    generic ( Period : natural := 100) ;
    port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Clk_out : out STD_LOGIC
           );
end Clk_div;

architecture Behavioral of Clk_div is
    
    signal Count : natural :=1;
    signal Clk_aux : STD_LOGIC := '0';
    constant PER : natural := 50_000;
    
begin
    Clk_out <= Clk_aux;
    process(RST,CLK)
        begin
            if(RST ='1') then
                Clk_aux <= '0';
                Count <= 1;
            elsif(rising_edge(CLK)) then
                if(Count = PER * Period) then
                    Count <= 1;
                    Clk_aux <= not CLK_aux;
                else
                    Count <= Count + 1;
                end if;
            end if;
    end process;

end Behavioral;
