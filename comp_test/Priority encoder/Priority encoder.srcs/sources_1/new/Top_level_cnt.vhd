
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_level_cnt is
    port(CLK : in STD_LOGIC;
         RST : in STD_LOGIC;
         En : in STD_LOGIC;
         Cout : out STD_LOGIC;
         Q : out STD_LOGIC_VECTOR(11 downto 0)
    );
end Top_level_cnt;

architecture Behavioral of Top_level_cnt is
    
    component Counter_pornit_oprit is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          En : in STD_LOGIC;
          Rst_auto : in STD_LOGIC;
          Alw_cnt : in STD_LOGIC;
          Cout : out STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
          );   
    end component;
    
    signal Cout_sig_1 : STD_LOGIC;
    signal Cout_sig_2 : STD_LOGIC;
    signal Cout_final : STD_LOGIC := '0';
    
begin
    
    C_lsb : Counter_pornit_oprit port map(
        CLK => CLK,
        RST => RST,
        En => En,
        Cout => Cout_sig_1,
        Rst_auto => Cout_final,
        Alw_cnt => '1',
        Q_out => Q(3 downto 0)
    );
    
    C_2 : Counter_pornit_oprit port map(
        CLK => CLK,
        RST => RST,
        En => En,
        Cout => Cout_sig_2,
        Rst_auto => Cout_final,
        Alw_cnt => Cout_sig_1,
        Q_out => Q(7 downto 4)
    );
    
    C_msb : Counter_pornit_oprit port map(
        CLK => CLK,
        RST => RST,
        En => En,
        Cout => Cout_final,
        Rst_auto => Cout_final,
        Alw_cnt => Cout_sig_2,
        Q_out => Q(11 downto 8)
    );
    Cout <= Cout_final;
end Behavioral;
