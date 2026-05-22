
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM_modulator is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Val : in STD_LOGIC_VECTOR(15 downto 0);
          Leds_out : out STD_LOGIC_VECTOR(15 downto 0)
          );
end PWM_modulator;

architecture Behavioral of PWM_modulator is
    
    component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
    end component;
    
    component Counter_16_bit is
    port(
        CLK :  in STD_LOGIC;
        RST : in STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR(15 downto 0)
    );
    end component;
    
    component Comparator_16bit is
    port( A : in  STD_LOGIC_VECTOR(15 downto 0);
          B : in  STD_LOGIC_VECTOR(15 downto 0);
          O : out STD_LOGIC_VECTOR(2 downto 0)  -- We 001 -> < ; 010 - = ; 100 - = >
          );
    end component;
    
    signal Q_counter_out : STD_LOGIC_VECTOR(15 downto 0);
    signal Out_comp : STD_LOGIC_VECTOR(2 downto 0);
    signal RST_BTN : STD_LOGIC;
begin

    BTN_RST : MPG port map(
        CLK => CLK,
        btn => RST,
        en => RST_BTN
        );

    counter : Counter_16_bit port map(
        CLK => CLK,
        RST => RST,
        Q_out => Q_counter_out
    ); 
    
    comp_bit : Comparator_16bit port map(
    
        A => Q_counter_out,
        B => Val,
        O => Out_comp     
    );
    
    -- Out comp : 100 < ; A < B , LEDS_OUT = A else LEDST = 0;
    
    Leds_out <= (others=>'1') when Out_comp = "001" else (others=>'0');
    
end Behavioral;
