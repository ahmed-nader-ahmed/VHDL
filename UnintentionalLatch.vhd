-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;


-- Entity Port Declaration
entity UnintentionalLatch is 
    port (
        A, B, C, d : in std_logic;
        y : out std_logic);
end entity UnintentionalLatch;

-- Architecture of UnintentionalLatch
architecture UnintentionalLatch_Arch of UnintentionalLatch is
begin
	COMBINATIONAL_PROCESS : process (a, b, c, d)
    begin
    	if 		(c = '1' and d = '1') 	then 	y <= '0';
        elsif 	(A = '1' and b = '1') 	then 	y <= '1';
        else									y <= '0'; -- if removed then o/p is latched
        end if;
    end process COMBINATIONAL_PROCESS;
    
end architecture UnintentionalLatch_Arch;