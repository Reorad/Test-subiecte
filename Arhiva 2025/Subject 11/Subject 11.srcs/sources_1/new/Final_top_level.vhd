
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Final_top_level is
    port(CLK : in STD_LOGIC;
         RST : in STD_LOGIC;
         S_in : in STD_LOGIC;
         Cnt_bnt : in STD_LOGIC;
         Q_leds_cnt_out : out STD_LOGIC_VECTOR(3 downto 0);
         Q_leds_reg_out : out STD_LOGIC_VECTOR(3 downto 0)
         );
end Final_top_level;

architecture Behavioral of Final_top_level is
    
    component Top_level is
    port (  CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            S_in : in STD_LOGIC;
            Q_leds_cnt_out : out STD_LOGIC_VECTOR(3 downto 0);
            Q_leds_reg_out : out STD_LOGIC_VECTOR(3 downto 0)
            );
    end component;
    
    component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
    end component;
    
    signal BTN_CNT_OUT : STd_LOGIC;
    
begin
    
    C : Top_level port map(
        CLK => BTN_CNT_OUT,
        RST => RST,
        S_in => S_in,
        Q_leds_cnt_out => Q_leds_cnt_out,
        Q_leds_reg_out => Q_leds_reg_out
    );
    
    Btn_cn : MPG port map(
        btn => Cnt_bnt,
        clk => clk,
        en => BTN_CNT_OUT
    );

end Behavioral;
