
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    generic ( ADD : natural := 6;
              ADD_Lenght : natural := 16 );
    port( CLK : in STD_LOGIC;
          WE : in STD_LOGIC;
          RST : in STD_LOGIC;
          Add_in : in STD_LOGIC_VECTOR(ADD-1 downto 0);
          Memory_in : in STD_LOGIC_VECTOR(ADD_Lenght - 1 downto 0);
          Data_out : out STD_LOGIC_VECTOR(ADD_Lenght - 1 downto 0)
          );
end RAM;

architecture Behavioral of RAM is

    type RAM_MEM is array (0 to 2**ADD - 1) of STD_LOGIC_VECTOR(ADD_Lenght - 1 downto 0);
    signal RAM_t : RAM_MEM := (others => (others =>'0'));
begin
     process(CLK,RST)
        begin
            if(RST ='1') then
                Ram_t <= (others => (others => '0'));
            elsif(rising_edge(CLK)) then
                if(WE ='1') then
                    RAM_t(to_integer(unsigned(Add_in))) <= Memory_in;
                end if;
            end if;
     end process;
     Data_out <= RAM_t(to_integer(unsigned(Add_in)));
end Behavioral;
