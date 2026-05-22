----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2026 04:44:00 PM
-- Design Name: 
-- Module Name: Register - Behavioral
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

entity Registere is
    port(
        Load : in STD_LOGIC;
        CLK : in STD_LOGIC;
        Q_in : in STD_LOGIC_VECTOR(3 downto 0);
        RST : in STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Registere;

architecture Behavioral of Registere is
    
signal Q_aux : STD_LOGIC_VECTOR(3 downto 0) := (others =>'0');
    
begin
    process(CLK,RST)
        begin
            if(RST ='1') then
                Q_aux <= (others =>'0');
            elsif (rising_edge (clk)) then
                if(Load ='1') then
                    Q_aux <= Q_in;
                end if;
            end if;
    end process;
    Q_out <= Q_aux;
end Behavioral;
