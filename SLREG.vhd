-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity SLREG is 
    port (
        D : in std_logic; -- single bit
        CLK, RST, shift : in std_logic;
        Q : out std_logic_vector(3 downto 0));
end entity SLREG;

-- Architecture of SLREG
architecture SLREG_Arch of SLREG is
begin
    SHIFTING_PROCESS : process (CLK, RST)
    begin
    	if (RST = '0') then
        	Q <= "0000";
        elsif (rising_edge(CLK)) then
        	if (shift = '1') then
--             	q(3) <= Q(2);
--                 q(2) <= Q(1);
--                 q(1) <= Q(0);
--         		Q(0) <= D;
                q <= Q(2 downto 0) & d;
            end if;
        end if;
    end process SHIFTING_PROCESS;
    
    
end architecture SLREG_Arch;