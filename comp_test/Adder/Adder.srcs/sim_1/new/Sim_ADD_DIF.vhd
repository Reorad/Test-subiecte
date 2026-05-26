----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2026 02:08:29 PM
-- Design Name: 
-- Module Name: Sim_ADD_DIF - Behavioral
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

entity Sim_ADD_DIF is
--  Port ( );
end Sim_ADD_DIF;

architecture Behavioral of Sim_ADD_DIF is

component ALU_1bit is
    port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Bin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Bout : out STD_LOGIC;
           Res_out_SUB : out STD_LOGIC;
           Res_out_ADD : out STD_LOGIC
           );
end component;

    signal A,B,Cin,Bin,Cout,Bout,Res_out_SUB,Res_out_ADD : STD_LOGIC := '0';

begin
    
    UUT : ALU_1bit port map(
        A=>A,
        B=>B,
        Cin => Cin,
        Bin => Bin,
        Cout => Cout,
        Bout => Bout,
        Res_out_SUB => Res_out_SUB,
        Res_out_ADD => Res_out_ADD    
    );
    
    process
        begin
            A <= '1';
            B <= '0';
            Bin <= '0';
            Cin <= '0';
            wait for 10ns;
            A <= '0';
            B <= '1';
            Bin <= '1';
            wait for 10ns;
            A <= '1';
            B <= '0';
            Bin <= '0';
            Cin <= '1';
            wait for 10ns;
            
            wait;
    end process;

end Behavioral;
