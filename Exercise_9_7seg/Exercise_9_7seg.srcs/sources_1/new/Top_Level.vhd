
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
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        Sel : in STD_LOGIC_VECTOR(1 downto 0);
        Add_in : in STD_LOGIC_VECTOR(2 downto 0);
        CLK : in STD_LOGIC;
        We : in STD_LOGIC;
        RST : in STD_LOGIC;
        CNT_BTN : in STD_LOGIC;
        Down_BTN : in STD_LOGIC;
        Leds_data_out : out STD_LOGIC_VECTOR(3 downto 0);
        Cathodes : out STD_LOGIC_VECTOR(7 downto 0);
        Anodes : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Top_Level;

architecture Behavioral of Top_Level is
    
    component Alu_4bits_RAM is
    port( ADD : in STD_LOGIC_VECTOR(2 downto 0);
          RST : in STD_LOGIC;
          CLK : in STD_LOGIC;
          A : in STD_LOGIC_VECTOR(3 downto 0);
          B : in STD_LOGIC_VECTOR(3 downto 0);
          SEL : in STD_LOGIC_VECTOR(1 downto 0);
          We : in STD_LOGIC;
          
          Mem_out : out STD_LOGIC_VECTOR(3 downto 0)
          
          );
    end component;
    
    
    component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
    end component;
    
    component ssd_7seg is
    Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
           SegOut : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal RAM_Data : STD_LOGIC_VECTOR(3 downto 0);
    signal CNT_BTN_out : STD_LOGIC;
    signal DW_BTN_OUT : STD_LOGIC;
    signal Count_anodes : natural := 1;
begin
    Leds_data_out <= RAM_Data;
    
    Btn_clk : MPG port map(
        CLK=>CLK,
        btn => CNT_BTN,
        en => CNT_BTN_out
    ); 
    
    Btn_anodes : MPG port map(
        CLK=>CLK,
        btn => Down_BTN,
        en => DW_BTN_OUT
    );
    
    Ram_top_comp : Alu_4bits_RAM port map(
        A => A,
        B => B,
        Sel => Sel,
        ADD => Add_in,
        RST => RST,
        CLK => CNT_BTN_out,
        We => We,
        Mem_out => RAM_Data 
    );
   
    Seg_out : ssd_7seg port map(
        DataIn =>  RAM_Data,
        SegOut => Cathodes
    );
    
    process(DW_BTN_OUT, RST)
        begin
            if ( RST ='1' )then
                Count_anodes <= 1;
            elsif ( rising_edge(DW_BTN_OUT)) then
                if(Count_anodes < 4) then
                   Count_anodes <= Count_anodes + 1;
                else
                    Count_anodes <= 1; 
                end if;
            end if;
    end process;
    
    process(Count_anodes)
        begin
            case Count_anodes is 
                when 1 => Anodes <= not x"1";
                when 2 => Anodes <= not x"2";
                when 3 => Anodes <= not x"4";
                when 4 => Anodes <= not x"8";
                when others => Anodes <= not x"0";
            end case;
    end process;
    
end Behavioral;
