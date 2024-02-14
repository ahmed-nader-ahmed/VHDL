-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity MyFSM is 
    port (
        Run : in std_logic;
        CLK, RST : in std_logic;
        Result : out std_logic);
end entity MyFSM;

-- Architecture of MyFSM
architecture MyFSM_Arch of MyFSM is
  type state_type is (S0, S1);
  signal current_state, next_state : state_type;
begin
	-- Current State Circuit (SEQUENTIAL)
    CURRENT_STATE_PROCESS : process (CLK, RST)
    begin
    	if (RST = '0') then
        	current_state <= S0;
        elsif (rising_edge(CLK)) then
        	current_state <= next_state;
        end if;
    end process CURRENT_STATE_PROCESS;
    
    -- Output Circuit (COMBINATIONAL)
    OUTPUT_PROCESS : process (current_state, Run)
    begin
    	case current_state is
        	when S0 =>
            	Result <= '0';
            when S1 =>
            	Result <= '1';
          	when others =>
            	Result <= '0';
        end case;
    end process OUTPUT_PROCESS;
    
    -- Next State Circuit (COMBINATIONAL)
    NEXT_STATE_PROCESS : process (current_state, Run)
    begin
    	case current_state is
        	when S0 =>
            	if (Run  = '1') then
                	next_state <= S1;
                else
                	next_state <= S0;
                end if;
            when S1 =>
            	if (Run  = '1') then
                	next_state <= S0;
                else
                	next_state <= S1;
                end if;
          	when others =>
            	next_state <= S0;
        end case;
    end process NEXT_STATE_PROCESS;
    
end architecture MyFSM_Arch;