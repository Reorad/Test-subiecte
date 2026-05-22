----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2026 12:26:10 PM
-- Design Name: 
-- Module Name: SSD_DRIVER - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSD_DRIVER is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Data : in STD_LOGIC_VECTOR(15 downto 0); -- 15 biti ca printezi binar numarul pe 4 anozi --
          
          
          Cathodes : out STD_LOGIC_VECTOR(7 downto 0);
          Anodes : out STD_LOGIC_VECTOR(3 downto 0)
          );
end SSD_DRIVER;

architecture Behavioral of SSD_DRIVER is
        
    component ssd_7seg is
    Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
           SegOut : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    signal Data_anod_curr : STD_LOGIC_VECTOR(3 downto 0);
    
    
    component clk_div is
    generic ( per : natural := 1000);
    port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        CLk_out : out STD_LOGIC
    );
    end component;
    
    signal CLK_aux : STD_LOGIC;
    signal CNT : natural := 1;
begin
    
    CLK_D : clk_div
        generic map(2)
        port map( 
        CLK => CLK,
        RST => RST,
        Clk_out => CLK_aux 
        );
    
    process(CLk_aux, RST)
        begin
            if (RST ='1') then
                CNT <= 1;
            elsif(rising_edge(Clk_Aux)) then
                if(cnt < 4) then
                    cnt <= cnt + 1;
                else
                    cnt <= 1;
                end if;
            end if;
     end process;
     
     process(Data, CNT)
        begin
            case CNT is 
                when 1 => Data_anod_curr <= Data(3 downto 0);
                when 2 => Data_anod_curr <= Data(7 downto 4);
                when 3 => Data_anod_curr <= Data(11 downto 8);
                when 4 => Data_anod_curr <= Data(15 downto 12);
                when others => Data_anod_curr <= (others =>'0');
            end case;
     end process;
     
     process(CNT)
        begin
            case CNT is 
                when 1 => Anodes <= not x"1";
                when 2 => Anodes <= not x"2";
                when 3 => Anodes <= not x"4";
                when 4 => Anodes <= not x"8";
                when others => Anodes<=x"0";
            end case;
     end process;
     
     conver_7seg : ssd_7seg port map(
     
        DataIn => Data_anod_curr , 
        
        SegOut => Cathodes);
     
end Behavioral;
