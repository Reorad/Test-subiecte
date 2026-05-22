
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity clock_divider_gen is
    Generic (PERIOD: natural := 1000);     -- number of ms for the period
    Port (  rst: in STD_LOGIC;             -- default for 1000ms period
            clk_in : in STD_LOGIC;
            clk_out : out STD_LOGIC);
end clock_divider_gen;

architecture Behavioral of clock_divider_gen is
constant PER: natural := PERIOD*50000;
signal count: natural := 1;
signal clk_out_aux: std_logic := '0';
begin

process(rst, clk_in)
begin
    if rst = '1' then
        count <= 1;
    elsif rising_edge(clk_in) then
        count <= count + 1;
        if count = PER then
            count <= 1;
            clk_out_aux <= not clk_out_aux;
        end if;
    end if;
end process;

clk_out <= clk_out_aux;
end Behavioral;
