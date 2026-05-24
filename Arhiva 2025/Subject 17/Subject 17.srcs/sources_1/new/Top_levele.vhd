----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2026 09:42:29 PM
-- Design Name: 
-- Module Name: Top_levele - Behavioral
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

entity Top_levele is
    port ( Up_btn : in STD_LOGIC;
           Down_btn : in STD_LOGIC;
           Rst : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Result : out STD_LOGIC_VECTOR(3 downto 0);
           Cout : out STD_LOGIC
           );
end Top_levele;

architecture Behavioral of Top_levele is
    
    component Top_lvl is
    port ( Up_btn_clk : in STD_LOGIC;
           RST : in STD_LOGIC;
           Down_btn_clk : in STD_LOGIC ;
           Res_out : out STD_LOGIC_VECTOR(3 downto 0);
           Carry_out : out STD_LOGIC
           );
    end component;
    
    component MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           en : out STD_LOGIC);
    end component;
    
    signal Up_btn_out : STD_LOGIC;
    signal Dw_btn_out : STD_LOGIC;
    
begin
    
    Up : MPG port map(
        btn => Up_btn,
        en => Up_btn_out,
        CLK => CLK
    );
    
    Down : MPG port map(
        btn => Down_btn,
        en => Dw_btn_out,
        CLK => CLK
    );
    
    cnt : Top_lvl port map(
        Up_btn_clk => Up_btn_out,
        Down_btn_clk => Dw_btn_out,
        RST => RST,
        Res_out => Result,
        Carry_out => Cout
    );

end Behavioral;
