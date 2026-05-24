
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Level is
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Load : in STD_LOGIC;
        S_in : in STD_LOGIC;
        Btn_continue : in STD_LOGIC;
        Load_val : in STD_LOGIC_VECTOR(11 downto 0); 
        Leds_out : out STD_LOGIC_VECTOR(11 downto 0)
    );
end Top_Level;

architecture Behavioral of Top_Level is
    
    component bit12_register is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Load : in STD_LOGIC;
          S_in : in STD_LOGIC;
          Load_val : in STD_LOGIC_VECTOR(11 downto 0);
          Q_out : out STD_LOGIC_VECTOR(11 downto 0)
          );
    end component;
    
    component Clk_div is
    generic ( Period : natural := 100) ;
    port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Clk_out : out STD_LOGIC
           );
    end component;
    
    component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
    end component;
    
    signal Btn_continue_out : STD_LOGIC;
    
begin
    
    Btn_continue_comp : MPG port map(
        btn => Btn_continue,
        CLK => CLK,
        En => Btn_continue_out
    );
    
--    Clk_diver : Clk_div
--        generic map(2000) 
--        port map (
--        CLK => CLK,
--        RST => RST,
--        Clk_out => CLK_2Sec
--    );
    Register_12 : bit12_register port map(
        CLK => Btn_continue_out,
        RST => RST,
        Load => Load,
        S_in => S_in,
        Load_val => Load_val,
        Q_out => Leds_out
    ); 
end Behavioral;
