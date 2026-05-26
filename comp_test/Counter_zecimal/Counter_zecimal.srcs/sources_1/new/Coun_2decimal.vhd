
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Coun_2decimal is
    port (Clk : in STD_LOGIC;
          CLk_board : in STD_LOGIC;
          Small_impulse : in STD_LOGIC;
          RST : in STD_LOGIC;
          Cout : out STD_LOGIC;
          Cout_10s : out STD_LOGIC;
          Cout_100s : out STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(7 downto 0)
          );
end Coun_2decimal;

architecture Behavioral of Coun_2decimal is
    
    component decimal_counter is
    port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Up_c  : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Q_out : out STD_LOGIC_VECTOR(3 downto 0)
           );
    end component;
    
    signal C_out_1 : STD_LOGIC;
    signal C_out_2 : STD_LOGIC;
begin
    
    lsb_cnt : decimal_counter port map(
        CLK => CLK,
        RST => RST,
        Up_c => '1',
        Cout => C_out_1,
        Q_out => Q_out(3 downto 0) 
    );
    
    msb_cnt : decimal_counter port map(
        CLK => CLK,
        RST => RST,
        Up_c => C_out_1,
        Cout => C_out_2,
        Q_out => Q_out(7 downto 4) 
    );
    
    process(RST, CLk_board)
        begin
            if ( RST ='1') then
                Cout_10s <= '0';
            elsif(rising_edge(CLk_board)) then
                if(Small_impulse ='1') then
                    Cout_10s <= '0';
                end if;
                
                if(C_out_1 ='1') then
                    Cout_10s <='1';
                end if;
                
            end if;
    end process;
    
    process(RST, CLk_board)
        begin
            if ( RST ='1') then
                Cout_100s <= '0';
            elsif(rising_edge(CLk_board)) then
                if(Small_impulse ='1') then
                    Cout_100s <= '0';
                end if;
                
                if(C_out_2 ='1') then
                    Cout_100s <='1';
                end if;
                
            end if;
    end process;
    
    
    
end Behavioral;
