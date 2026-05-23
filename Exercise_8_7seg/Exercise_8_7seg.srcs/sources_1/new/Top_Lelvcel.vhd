
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Lelvcel is
    port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Cnt_Btn : in STD_LOGIC;
           Sel : in STD_LOGIC;
           Q_leds_out : out STD_LOGIC_VECTOR(3 downto 0);
           Cathodes : out STD_LOGIC_VECTOR(7 downto 0);
           Anodes : out STD_LOGIC_VECTOR(3 downto 0)
           );
end Top_Lelvcel;

architecture Behavioral of Top_Lelvcel is
    
    component Cnt_Top is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Sel : in STD_LOGIC;
          Q_leds_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    component ssd_7seg is
        Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
               SegOut : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
    end component;
    
    signal Btn_out_cnt : STD_LOGIC;
    signal Q_leds_aux : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    
    Coutner : Cnt_Top port map(
        CLK => Btn_out_cnt,
        Sel => Sel,
        RST => RST,
        Q_leds_out => Q_leds_aux
    ); 
    
    BTN : MPG port map(
        btn => Cnt_Btn,
        clk => clk,
        en => Btn_out_cnt );
    
    SS7 : ssd_7seg port map(
        DataIn => Q_leds_aux ,
        SegOut => Cathodes 
    );
    
    Anodes <= "1101";    
    
end Behavioral;
