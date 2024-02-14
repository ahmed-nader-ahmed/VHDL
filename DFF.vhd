-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity DFF is 
    port (
        D : in std_logic;
        CLK, RST, SET : in std_logic;
        Q : out std_logic);
end entity DFF;

-- Architecture of DFF
architecture DFF_Arch of DFF is
begin
    REGISTERING_PROCESS : process (CLK, RST) -- ASYNC POSITIVE RESET
    begin
    	if (RST = '1') then
        	Q <= '0';
        elsif (rising_edge(CLK)) then
        	if (set = '0') then -- ASYNC NEGATIVE SET
        		Q <= '1';
          	else 
            	Q <= d;
          	end if;
                
        end if;
    end process REGISTERING_PROCESS;
    
    
end architecture DFF_Arch;


-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity DFF is 
    port (
        D : in std_logic;
        CLK, RST : in std_logic;
        Q : out std_logic);
end entity DFF;

-- Architecture of DFF
architecture DFF_Arch of DFF is
begin
    REGISTERING_PROCESS : process (CLK, RST)
    begin
    	
        if (rising_edge(CLK)) then
        	if (RST = '1') then -- SYNC POSITIVE RESET
        		Q <= '0';
          	else 
            	Q <= d;
          	end if;
                
        end if;
    end process REGISTERING_PROCESS;
    
    
end architecture DFF_Arch;


