
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity bit4_up_counter is
    port(
        RST : in STD_LOGIC;
        CLK : in STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
end bit4_up_counter;

architecture Behavioral of bit4_up_counter is
    
    signal Q_aux : STD_LOGIC_VECTOR(3 downto 0) := (others =>'0');
    
begin
    Q_out <= Q_aux;
    
    process(CLK,RST)
        begin
            if(RST ='1') then
                Q_aux <= (others =>'0');
            elsif (rising_edge(CLK)) then
                Q_aux <= Q_aux + 1;
            end if;
    end process;

end Behavioral;
