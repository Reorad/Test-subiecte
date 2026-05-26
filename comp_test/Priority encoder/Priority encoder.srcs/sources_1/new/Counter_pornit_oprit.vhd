
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter_pornit_oprit is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          En : in STD_LOGIC;
          Rst_auto : in STD_LOGIC;
          Alw_cnt : in STD_LOGIC;
          Cout : out STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
          
end Counter_pornit_oprit;

architecture Behavioral of Counter_pornit_oprit is
    signal COunt_vec : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout_Aux : STD_LOGIC :='0';
begin
    
    Cout_aux <= '1' when Count_vec = "1111" else '0';
    Cout <= Cout_aux;
    Q_out <= Count_Vec;
    process(CLK,RST)    
        begin
            if(RST ='1') then
                Count_Vec <= (others => '0');
            elsif (rising_edge(CLK)) then
                if(Rst_Auto = '1' ) then
                    Count_vec <= (others => '0');
                elsif(En ='1' AND Cout_aux ='0' AND Alw_cnt ='1'  ) then
                    Count_vec <= STD_LOGIC_VECTOR(unsigned(Count_Vec) + 1);
                end if;    
            end if;            
    end process;
end Behavioral;
