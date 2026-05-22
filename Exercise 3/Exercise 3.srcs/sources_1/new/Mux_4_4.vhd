


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_4_4 is
    port ( Input_1 : in STD_LOGIC_VECTOR(3 downto 0);
           Input_2 : in STD_LOGIC_VECTOR(3 downto 0);
           Input_3 : in STD_LOGIC_VECTOR(3 downto 0);
           Input_4 : in STD_LOGIC_VECTOR(3 downto 0);
           Sel : in STD_LOGIC_VECTOR(1 downto 0);
           O : out STD_LOGIC_VECTOR(3 downto 0) );
end Mux_4_4;

architecture Behavioral of Mux_4_4 is
    
    
    component Mux_4_1 is
        port ( I : in STD_LOGIC_VECTOR(3 downto 0);
               S : in STD_LOGIC_VECTOR(1 downto 0);
               O : out STD_LOGIC );
    end component;
    
    signal First_mux_sel : STD_LOGIC_VECTOR(3 downto 0) ;
    signal Sec_mux_sel : STD_LOGIC_VECTOR(3 downto 0) ;
    signal Trd_mux_sel : STD_LOGIC_VECTOR(3 downto 0) ;
    signal Last_mux_sel : STD_LOGIC_VECTOR(3 downto 0) ;
begin
    First_mux_sel <= (Input_4(0) & Input_3(0) & Input_2(0) & Input_1(0) );
    Mux_1 : Mux_4_1 port map(
        I => First_mux_sel ,
        S => Sel,
        O => O(0) );
        
    Sec_mux_sel <= (Input_4(1) & Input_3(1) & Input_2(1) & Input_1(1) );
    Mux_2 : Mux_4_1 port map(
        I => Sec_mux_sel ,
        S => Sel,
        O => O(1) );
    Trd_mux_sel <= (Input_4(2) & Input_3(2) & Input_2(2) & Input_1(2) );
    Mux_3 : Mux_4_1 port map(
        I => Trd_mux_sel ,
        S => Sel,
        O => O(2) );
        
    Last_mux_sel <= (Input_4(3) &  Input_3(3) & Input_2(3) & Input_1(3) );
    Mux_4 : Mux_4_1 port map(
        I => Last_mux_sel ,
        S => Sel,
        O => O(3) );
    
end Behavioral;
