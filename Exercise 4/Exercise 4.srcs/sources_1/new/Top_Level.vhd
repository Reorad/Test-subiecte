
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
          S_in : in STD_LOGIC;
          Data_leds : out STD_LOGIC_VECTOR(3 downto 0);
          Anodes : out STD_LOGIC_VECTOR(3 downto 0);
          Cathodes : out STD_LOGIC_VECTOR(7 downto 0)
          );
end Top_Level;

architecture Behavioral of Top_Level is
    
    component Clk_div is
    generic ( period : natural := 1000 );
    port(
        CLk : in STD_LOGIC;
        RST : in STD_LOGIC;
        Clk_out : out STD_LOGIC
    ); 
    end component;
    
    component Shift_reg is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          S_in : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

    component Conv_bin is
    port ( Data_in : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR(3 downto 0)
           );
    end component;

    component ssd_driver is
    Port ( Rst : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data: in STD_LOGIC_VECTOR (15 downto 0);
           Cathodes : out STD_LOGIC_VECTOR (7 downto 0);
           Anodes : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal Q_out_aux : STD_LOGIC_VECTOR(3 downto 0);
    signal Data_aux : STD_LOGIC_VECTOR(15 downto 0);
    signal CLK_1sec : STD_LOGIC :='0';
begin
    
    clko : Clk_div
        generic map(1000)
        port map(
        CLK => CLK,
        RST => RST,
        Clk_out => CLK_1sec
    );
    
    Q_0_data : Conv_bin port map(
        Data_in => Q_out_aux(0),
        Data_out => Data_aux(3 downto 0)
        );
     
    Q_1_data : Conv_bin port map(
        Data_in => Q_out_aux(1),
        Data_out => Data_aux(7 downto 4)
        );
        
    Q_2_data : Conv_bin port map(
        Data_in => Q_out_aux(2),
        Data_out => Data_aux(11 downto 8)
        );
        
     Q_3_data : Conv_bin port map(
        Data_in => Q_out_aux(3),
        Data_out => Data_aux(15 downto 12)
        );
      
      Shifter : Shift_reg port map(
         CLK => CLK_1sec,
         RST => RST,
         S_in => S_in,
         Q_out => Q_out_aux 
         );
         
       Data_leds <= Q_out_aux;   
         
       Printer : ssd_driver port map(
            Rst => RST,
            Clk => CLK,
            Data => Data_aux,
            Cathodes => Cathodes,
            Anodes => Anodes
       );
      
end Behavioral;
