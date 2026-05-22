
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity ssd_driver is
    Port ( Rst : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data: in STD_LOGIC_VECTOR (15 downto 0);
           Cathodes : out STD_LOGIC_VECTOR (7 downto 0);
           Anodes : out STD_LOGIC_VECTOR (3 downto 0));
end ssd_driver;

architecture Behavioral of ssd_driver is

component Clk_div is
    generic ( period : natural := 1000 );
    port(
        CLk : in STD_LOGIC;
        RST : in STD_LOGIC;
        Clk_out : out STD_LOGIC
    );
end component;

component segment7b is
    Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
           SegOut : out STD_LOGIC_VECTOR (7 downto 0));
end component;
-- new clock signal for the slwoer clock
signal clk_aux: std_logic:= '0';
-- auxiliars for the anodes and cathodes
signal cathodes_data: STD_LOGIC_VECTOR (3 downto 0) := "0000";
-- signal for counting the anodes
signal counter: natural range 1 to 4 := 1;
begin

divider: Clk_div generic map (2) port map (CLK => CLK, RST => RST, Clk_out => clk_aux);
converter: segment7b port map (cathodes_data, cathodes);

process (rst, clk_aux)
begin
    if rst = '1' then
        counter <= 1;
    elsif rising_edge(clk_aux) then
        if counter < 4 then
            counter <= counter + 1;
        else
            counter <= 1;
        end if;
    end if;
end process;


Anodes <= not x"1" when counter = 1 else
          not x"2" when counter = 2 else
          not x"4" when counter = 3 else
          not x"8" when counter = 4 else
          not x"0";
              
cathodes_data <= Data(15 downto 12) when counter = 4 else
                 Data(11 downto 8) when counter = 3 else
                 Data(7 downto 4) when counter = 2 else
                 Data(3 downto 0) when counter = 1 else
                 "0000";


end Behavioral;
