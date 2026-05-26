
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
          RST : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(7 downto 0);
          Cout : out STD_LOGIC;
          Sec_10 : out STD_LOGIC;
          Sec_100 : out STD_LOGIC 
          );
end Top_Level;

architecture Behavioral of Top_Level is
    
    component CLK_divider is
    generic( Period : natural := 1000);
    port (CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Clk_out : out STD_LOGIC );
    end component;
    
    component Coun_2decimal is
    port (Clk : in STD_LOGIC;
          CLk_board : in STD_LOGIC;
          Small_impulse : in STD_LOGIC;
          RST : in STD_LOGIC;
          Cout : out STD_LOGIC;
          Cout_10s : out STD_LOGIC;
          Cout_100s : out STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(7 downto 0)
          );
    end component;
    
    signal CLk_1sec : STD_LOGIC;
    signal Impuls_3sec : STD_LOGIC;
    signal Clk_3sec : STD_LOGIC;
    signal Clk_3sec_bfr : STD_LOGIC;
    
begin
    clk_d : CLK_divider 
        generic map(250)
        port map(
        CLK => CLK,
        RST => RST,
        Clk_out => CLk_1sec
    );
    
    count : Coun_2decimal port map(
        Clk => CLk_1sec,
        CLk_board => Clk,
        Small_impulse => Impuls_3sec,
        RST => RST,
        Cout => Cout, -- useless tbh -- 
        Cout_10s => Sec_10,
        Cout_100s => Sec_100,
        Q_out => Q_out
    );
    
    clk_d_sec_3 : CLK_divider 
        generic map(3000)
        port map(
        CLK => CLK,
        RST => RST,
        Clk_out => Clk_3sec
    );
    
    process(Clk,RST)
        begin
            if(RST ='1') then
                Clk_3sec_bfr <= '0';
            elsif(rising_edge(CLK)) then
                Clk_3sec_bfr <= Clk_3sec;
            end if; 
    end process;
    
    Impuls_3sec <= '1' when (Clk_3sec_bfr ='0' and Clk_3sec ='1') else '0';
    
end Behavioral;
