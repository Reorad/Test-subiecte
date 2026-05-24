----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2026 01:15:23 AM
-- Design Name: 
-- Module Name: Top_Level - Behavioral
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

entity Top_Level is
    port(CLK : in STD_LOGIC;
         Rst_btn : in STD_LOGIC;
         Load_btn : in STD_LOGIC;
         Continue_btn : in STD_LOGIC;
         Val_load : in STD_LOGIC_VECTOR(3 downto 0);
         Load_check : out STD_LOGIC;
         Leds_out : out STD_LOGIC_VECTOR(3 downto 0)
         );
end Top_Level;
    
    
architecture Behavioral of Top_Level is
    
    signal Load_en : STD_LOGIC;
    signal Load_disable : STD_LOGIC;
    
    
    component counter_4_bits is
    port(
        CLK : in STD_LOGIC;
--        Clk_slow : in STD_LOGIC;
        Load : in STD_LOGIC;
        Rst : in STD_LOGIC;
        Val_load : in STD_LOGIC_VECTOR(3 downto 0);
        Disable_load : out STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;
    
    
    component MPG is
        Port ( btn : in STD_LOGIC;
               clk : in STD_LOGIC;
               en : out STD_LOGIC);
    end component;
    
    signal Continue_btn_out : STD_LOGIC;
    signal Load_btn_out : STD_LOGIC;
    signal Rst_btn_out : STD_LOGIC;
    
begin
    
    Counter : counter_4_bits port map(
        CLK => Continue_btn_out,
--        Clk_slow => Continue_btn_out,
        RST => Rst_btn_out,
        Load => Load_en,
        Val_load => Val_load,
        Disable_load => Load_disable,
        Q_out => Leds_out
    );
    
    Continue_btn_comp : MPG port map(
        btn => Continue_btn,
        clk => CLK,
        en => Continue_btn_out

    );
    
    RST_btn_comp : MPG port map(
        btn => Rst_btn,
        clk => CLK,
        en => Rst_btn_out

    );
    
    Load_bnt_comp : MPG port map(
        btn => Load_btn,
        CLK => CLK,      
        en => Load_btn_out
    );
    
    process(CLK, Rst_btn_out)
        begin
            if(Rst_btn_out ='1') then
                Load_en <= '0';
            elsif(rising_edge(clk)) then
                if(Load_btn_out ='1') then
                    Load_en <= '1';
                elsif ( Continue_btn_out = '1' ) then
                    Load_en <= '0';
                end if;
             end if;
    end process;
    
   
    
    Load_check <= Load_en;
    
end Behavioral;
