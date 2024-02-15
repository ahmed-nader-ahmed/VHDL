-- Use Standard IEEE Library
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;

-- Entity Port Declaration
entity Counter is 
	generic (
      DATA_WIDTH : integer := 8
    );
    port (                 	
      CLK: 	in std_logic; 	-- clock
      RST:  in std_logic;  -- Active low, synchronous reset
      P:    in std_logic_vector(DATA_WIDTH-1 downto 0);  -- Parallel input
      LOAD:   in std_logic;  -- Parallel Enable (Load)
      CEP: in std_logic;  -- Count enable parallel input
      CET:  in std_logic; -- Count enable trickle input
      Q:   out std_logic_vector(DATA_WIDTH-1 downto 0);            			
      TC:  out std_logic  -- Terminal Count
	);            		
end entity Counter;

-- Architecture of Counter
architecture Counter_arch of Counter is
begin
    INCREMENT_PROCESS : process (RST, CLK)
    begin
        if (RST = '0') then Q <= "0000"; 
        elsif (rising_edge(CLK)) then 
            if (LOAD = '0') then Q <= P; 
            elsif (LOAD = '1' and CEP = '1' and CET = '1') then Q <= Q + "0001";
            end if;
        end if;
    end process INCREMENT_PROCESS;

    COMB_PROCESS : process (Q, CET, TC)
    begin
        if (Q = "1111" and CET = '1') then TC <= '1'; 
        else TC <= '0'; 
        end if;
    end process COMB_PROCESS;

    
    
end architecture Counter_arch;