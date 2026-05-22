
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Cnt_Top is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Sel : in STD_LOGIC;
          Q_leds_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
end Cnt_Top;

architecture Behavioral of Cnt_Top is
    
    component bit4_down_counter is
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;
    
    component bit4_up_counter is
    port(
        RST : in STD_LOGIC;
        CLK : in STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;
    
    signal Q_up : STD_LOGIC_VECTOR(3 downto 0);
    signal Q_down : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    
    CNT_UP : bit4_up_counter port map(
        RST => RST,
        CLK => CLK,
        Q_out => Q_up
    );
        
    CNT_Down : bit4_down_counter port map(
        RST => RST,
        CLK => CLK,
        Q_out => Q_down
    );
    
    process(Q_up, Q_down, Sel)
        begin
            if(Sel ='0') then
                Q_leds_out <= Q_up;
            else 
                Q_leds_out <= Q_down;
            end if;
    end process;
    
end Behavioral;
