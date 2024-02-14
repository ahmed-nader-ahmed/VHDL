-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity ParallelRegister4Bit is 
    port (
        D : in std_logic_vector(3 downto 0);
        CLK, RST, LOAD, EN : in std_logic;
        Q : out std_logic_vector(3 downto 0));
end entity ParallelRegister4Bit;

-- Architecture of ParallelRegister4Bit
architecture ParallelRegister4Bit_Arch of ParallelRegister4Bit is
begin
    REGISTERING_PROCESS : process (CLK, RST)
    begin
    	if (RST = '0') then
        	Q <= "0000";
        elsif (rising_edge(CLK)) then
        	if (load = '1') then
        		Q <= D;
            elsif (en = '1') then
                Q <= q + 1;
            end if;
        end if;
    end process REGISTERING_PROCESS;
    
    
end architecture ParallelRegister4Bit_Arch;