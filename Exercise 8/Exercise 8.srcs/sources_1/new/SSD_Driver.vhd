
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSD_Driver is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Data : in STD_LOGIC_VECTOR(15 downto 0);
          Cathodes : out STD_LOGIC_VECTOR(7 downto 0);
          Anodes : out STD_LOGIC_VECTOR(3 downto 0)
          );
end SSD_Driver;

architecture Behavioral of SSD_Driver is
    signal CLK_small : STD_LOGIC;
    
    component CLK_Div is
    generic ( per : natural := 1000 ); 
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        CLK_aux : out STD_LOGIC
    );
    end component;
    
    component ssd_7seg is
    Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
           SegOut : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal Cathodes_data_select : STD_LOGIC_VECTOR(3 downto 0);
    signal Counteing : natural := 1;
    
begin
     
     CLK_diver : CLK_Div generic map(2) port map(
                CLK => CLK,
                RST => RST,
                Clk_aux => CLK_small
                );
                
     process(CLK_small,RST)
        begin
            if( RST = '1' ) then
                Counteing <= 1;
            elsif(rising_edge(clk_small)) then
                if ( Counteing < 4) then
                    Counteing <= Counteing + 1;
                else
                    Counteing <= 1;
                end if;
            end if;
     end process;
    
    process(Data, Counteing)
        begin
             case Counteing is
                 when 1 => Cathodes_data_select <= Data(3 downto 0);
                 when 2 => Cathodes_data_select <= Data(7 downto 4);
                 when 3 => Cathodes_data_select <= Data(11 downto 8);
                 when 4 => Cathodes_data_select <= Data(15 downto 12);
                 when others => Cathodes_data_select <= "1111";
             end case;
    end process;
    
    
    convert7seg : ssd_7seg port map(
                                    DataIn => Cathodes_data_select, 
                                    SegOut => Cathodes);
    
    process(Counteing)
        begin
            case Counteing is
                when 1 => Anodes <= "1110";
                when 2 => Anodes <= "1101";
                when 3 => Anodes <= "1011";
                when 4 => Anodes <= "0111";
                when others => Anodes <= "1111";
            end case;
    end process;
    
    
end Behavioral;
