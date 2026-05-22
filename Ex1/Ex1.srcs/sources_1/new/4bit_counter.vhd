
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity bit4_counter is
    port( En_count : in STD_LOGIC;
          Dir_count : in STD_LOGIC;
          Load_value : in STD_LOGIC_VECTOR(3 downto 0);
          CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Load : in STD_LOGIC;
          Cin : in STD_LOGIC;
          Bin : in STD_LOGIC;
          Cout : out STD_LOGIC;
          Bout : out STD_LOGIC;
          Q_state : out STD_LOGIC_VECTOR(3 downto 0)
          );
end bit4_counter;

architecture Behavioral of bit4_counter is
    
    
    signal Q_aux : STD_LOGIC_VECTOR(3 downto 0);
begin
    
    process(CLK,RST,LOAD, Load_value)
        begin
            if(Rst = '1') then
                Q_aux <= (others =>'0');
            elsif ( Load = '1' ) then
                Q_aux <= Load_value;
            elsif (rising_edge(CLK)) then
                if(En_count ='1' ) then
                    if(Dir_count = '1' AND Cin = '1' ) then
                        Q_aux <= Q_aux + 1;
                    elsif ( Dir_count = '0' AND  Bin = '1' ) then
                        Q_aux <= Q_aux - 1;    
                    end if;
                end if;                
            end if;
    end process;
    
    Q_state <= Q_aux;
    
    process (Q_aux, En_count, Dir_count,Cin, Bin )
        begin
            if(En_count = '1') then
                if(Q_aux = "1111" and Dir_count = '1' and Cin ='1') then
                    Cout <='1';
                else
                    Cout <='0';
                end if;
                if(Q_aux = "0000" and Dir_count = '0' and Bin ='1') then
                    Bout <='1';
                else
                    Bout <='0';
                end if;
            else
                Cout <='0';
                Bout <='0';
            end if;
    end process;
    
end Behavioral;
