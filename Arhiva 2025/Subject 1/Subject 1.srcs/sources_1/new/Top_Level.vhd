
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
    port( CLK : in STD_LOGIC;
          BTN_CONTINUE : in STD_LOGIC;
          RST : in STD_LOGIC;
          Leds_out_ROM : out STD_LOGIC_VECTOR(3 downto 0)
          );
end Top_Level;

architecture Behavioral of Top_Level is
    
    
    component Top_lvl_ROM_CNT is
    port(CLK : in STD_LOGIC;
         RST : in STD_LOGIC;
         Q_out_rom : out STD_LOGIC_VECTOR(3 downto 0) 
         );
    end component;

    component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
    end component;
    
    signal Cnt_btn_out : STD_LOGIC;
    
begin
    
    CNT : Top_lvl_ROM_CNT port map(
        CLK => Cnt_btn_out,
        RST => RST,
        Q_out_rom => Leds_out_ROM
    );
    
    Btn_cnt : MPG port map(
        CLK => CLK,
        btn => BTN_CONTINUE,
        en => Cnt_btn_out
    );
    
end Behavioral;
