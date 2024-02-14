LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;

entity AAC2M2P1 is 
    port (                 	
    CP: 	in std_logic; 	-- clock
    SR:  in std_logic;  -- Active low, synchronous reset
    P:    in std_logic_vector(3 downto 0);  -- Parallel input
    PE:   in std_logic;  -- Parallel Enable (Load)
    CEP: in std_logic;  -- Count enable parallel input
    CET:  in std_logic; -- Count enable trickle input
    Q:   out std_logic_vector(3 downto 0);            			
        TC:  out std_logic  -- Terminal Count
);            		
end AAC2M2P1;

architecture AAC2M2P1_arch of AAC2M2P1 is
begin
    increment_process : process (PE, CEP, CET, SR, CP)
    begin
        if (SR = '0') then Q <= "0000"; 
        elsif (rising_edge(CP)) then 
            if (PE = '0') then Q <= P; 
            elsif (PE = '1' and CEP = '1' and CET = '1') then Q <= Q + "0001";
            end if;
        end if;
    end process increment_process;

    combinational_process : process (Q, CET, TC)
    begin
        if (Q = "1111" and CET = '1') then TC <= '1'; 
        else TC <= '0'; 
        end if;
    end process combinational_process;

    
    
end architecture AAC2M2P1_arch;