
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
        SEL : in STD_LOGIC;
        BTN_Cont : in STD_LOGIC;
        Leds_out : out STD_LOGIC_VECTOR(3 downto 0);
        Anodes : out STD_LOGIC_VECTOR(3 downto 0);
        Cathodes : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Top_Level;

architecture Behavioral of Top_Level is
    
    component CLK_Div is
    generic ( per : natural := 1000 ); 
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        CLK_aux : out STD_LOGIC
    );
    end component;
    
    component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
    end component;
    
    component SSD_Driver is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Data : in STD_LOGIC_VECTOR(15 downto 0);
          Cathodes : out STD_LOGIC_VECTOR(7 downto 0);
          Anodes : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    component Cnt_Top is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Sel : in STD_LOGIC;
          Q_leds_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    
    signal Data_out_Counter : STD_LOGIC_VECTOR(3 downto 0);
    signal Binary_data_conv : STD_LOGIC_VECTOR(15 downto 0);
    signal BTN_Counter : STD_LOGIC;
begin
    
        Binary_data_conv <= "000" & Data_out_counter(3) & "000" & Data_out_counter(2) & "000" & Data_out_counter(1) & "000" & Data_out_counter(0);   
        
    Printer_7seg : SSD_Driver port map(
        CLK => CLK,
        RST => RST,
        Data => Binary_data_conv,
        Cathodes => Cathodes,
        Anodes =>  Anodes   
        );
        
     Btn_continue : MPG port map(
        CLK => CLK,
        BTN => BTN_Cont,
        en => BTN_Counter
     );
    
    Counter : Cnt_Top port map(
        CLK => BTN_Counter,
        RST => RST,
        Sel => SEL,
        Q_leds_out => Data_out_counter);
    
    Leds_out <= Data_out_counter;
    
end Behavioral;
