
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shift_Register is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          S_in : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
end Shift_Register;

architecture Behavioral of Shift_Register is
    signal Q_int_aux : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    Q_out <= Q_int_aux;
    process(CLK,RST)
        begin
            if(RST ='1') then
                Q_int_aux <= (others =>'0');
            elsif(rising_edge(CLk)) then
                Q_int_aux <= Q_int_aux(2 downto 0) & S_in;
            end if;
    end process;

end Behavioral;
