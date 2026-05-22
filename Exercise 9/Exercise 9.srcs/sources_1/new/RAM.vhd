
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    port(
        Add : in STD_LOGIC_VECTOR(2 downto 0);
        Data_in : STD_LOGIC_VECTOR(3 downto 0);
        We : STD_LOGIC;
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Data_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
end RAM;

architecture Behavioral of RAM is
   
    type Ram_mem is array (0 to 7) of STD_LOGIC_VECTOR(3 downto 0); 
    signal Ram_t : Ram_mem :=(others => (others=>'0'));   
begin
    
    process(CLK,RST)
        begin
            if(RST ='1') then
                Ram_t <= (others => (others =>'0'));
            elsif(rising_edge(CLK)) then
                if ( WE = '1' ) then
                    Ram_t(to_integer(unsigned(Add))) <= Data_in;
                end if;
            end if;
    end process;
    
    Data_out <= Ram_t(to_integer(unsigned(Add)));
    
end Behavioral;
