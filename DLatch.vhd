-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity DLatch is 
    port (
        D : in std_logic;
        CLK, RST : in std_logic;
        Q : out std_logic);
end entity DLatch;

-- Architecture of DLatch
architecture DLatch_Arch of DLatch is
begin
    LATCHING_PROCESS : process (CLK, RST, d)
    begin
    	if (RST = '0') then -- ASYNC NEGATIVE RESET
        	Q <= '0';
        elsif (CLK = '1') then
        	Q <= D;
        end if;
    end process LATCHING_PROCESS;
    
    
end architecture DLatch_Arch;