
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Bit4_detector is
    port(
        A : in STD_LOGIC_VECTOR(3 downto 0);
        Sw_mode : in STD_LOGIC; -- 0 detection 1 -- parity generate 
        
        Leds_out : out STD_LOGIC_VECTOR(4 downto 0);
        Cathodes : out STD_LOGIC_VECTOR(7 downto 0);
        Anodes : out STD_LOGIC_VECTOR(3 downto 0);
        Number_out : out STD_LOGIC_VECTOR(4 downto 0)
    );
end Bit4_detector;
    
architecture Behavioral of Bit4_detector is
    signal N_nat : natural := 0;
    signal PAR_BIT : STD_LOGIC;
begin
    process(A)
        variable N_nat_Aux : natural;
        begin
            N_nat_aux := 0;
            if(A(0) ='1' ) then
                 N_nat_aux := N_nat_aux + 1;
            end if;
            if(A(1) ='1') then
                N_nat_aux := N_nat_aux + 1;
            end if;
            if(A(2) ='1') then
                N_nat_aux := N_nat_aux + 1;
            end if;
            if(A(3) ='1') then
                N_nat_aux := N_nat_aux + 1;
            end if;
            N_nat <= N_nat_aux;
    end process;
    
    process(N_nat)
        begin
            if(N_nat mod 2 = 1 )then
                PAR_BIT <= '1';
            else
                PAR_BIT <= '0';
            end if;
    end process;
    
    process(A,N_nat,Sw_mode,PAR_BIT )
        begin
            if(Sw_mode ='0') then
                if (N_nat mod 2 = 1 ) then
                    Cathodes <="11111001"; 
                else
                    Cathodes <="10001100";
                end if; 
                Number_out <= (others => '0');
                Leds_out <= "11111";
            else
                Cathodes <= "10111111";
                Number_out <= A & PAR_BIT;
                Leds_out <= (others => '0');
            end if;  
    end process;
    
    Anodes <= not x"1";
    
end Behavioral;
