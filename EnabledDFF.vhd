-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity EnabledDFF is 
    port (
        D : in std_logic;
        CLK, RST, en : in std_logic;
        Q : out std_logic);
end entity EnabledDFF;

-- Architecture of EnabledDFF
architecture EnabledDFF_Arch of EnabledDFF is
begin
    REGISTERING_PROCESS : process (CLK, RST) -- ASYNC POSITIVE RESET
    begin
    	if (RST = '1') then
        	Q <= '0';
        elsif (rising_edge(CLK)) then
        	if (EN = '1') then -- ENABLE
        		Q <= d;
          	end if;
                
        end if;
    end process REGISTERING_PROCESS;
    
    
end architecture EnabledDFF_Arch;
