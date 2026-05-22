
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
    port (CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Cathoes : out STD_LOGIC_VECTOR(7 downto 0);
          AN_SW : in STD_LOGIC_VECTOR(1 downto 0);
          Anodes : out STD_LOGIC_VECTOR(3 downto 0) -- 4 anozi pe placa lui Oltean altfel 8 --
          );
end Top_Level;

architecture Behavioral of Top_Level is
    
    component counter is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    
    component clock_divider_gen is
    Generic (PERIOD: natural := 1000);     -- number of ms for the period
    Port (  rst: in STD_LOGIC;             -- default for 1000ms period
            clk_in : in STD_LOGIC;
            clk_out : out STD_LOGIC);
    end component;
    
    component ssd_7seg is
    Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
           SegOut : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal Q_count : STD_LOGIC_VECTOR(3 downto 0);
    signal CLK_1SEC : STD_LOGIC;
begin
    
    clock_divid :clock_divider_gen generic map(1000) 
             port map(
            RST => RST,
            CLK_IN => CLK,
            clk_out => CLK_1SEC
        );
    
    cnt : counter port map(
            CLK => CLK_1SEC,
            RST => RST,
            Q_out => Q_count );
    
    convert_seg : ssd_7seg port map(
        DataIn => Q_count,
        SegOut => Cathoes );
    
    process(An_sw)
        begin
            case An_sw is 
                when "00" => Anodes <="1110" ;
                when "01" => Anodes <="1101" ;
                when "10" => Anodes <="1011" ;
                when "11" => Anodes <="0111" ;
                when others => Anodes <= "1111";
            end case;
    end process;
    
end Behavioral;
