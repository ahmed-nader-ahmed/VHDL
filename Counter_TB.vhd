-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all; -- to declare unsigned or unsigned casting or to_integer casting
use IEEE.std_logic_unsigned.all; -- for using +
use ieee.std_logic_textio.all;
use std.textio.all;

-- NO Entity Port Declaration
entity Counter_TB is 
end entity Counter_TB;

-- Architecture of Counter_TB
architecture Counter_TB_Arch of Counter_TB is
	-- component
	component Counter 
    	generic (
          DATA_WIDTH : integer := 8
        );
    	port (
          -- not necessary to be same port names as in design
          CLK: 	in std_logic; 	-- clock
          RST:  in std_logic;  -- Active low, synchronous reset
          P:    in std_logic_vector(DATA_WIDTH-1 downto 0);  -- Parallel input
          LOAD:   in std_logic;  -- Parallel Enable (Load)
          CEP: in std_logic;  -- Count enable parallel input
          CET:  in std_logic; -- Count enable trickle input
          Q:   out std_logic_vector(DATA_WIDTH-1 downto 0);            			
          TC:  out std_logic  -- Terminal Count
        );
  	end component Counter;
    
    -- LOCAL VARIABLES
    	-- stimulus
   	constant CLOCK_PERIOD : time := 20 ns;
   	constant DATA_WIDTH_TB : integer := 4;  
    signal CLK_TB: std_logic := '0'; 	-- clock
    signal RST_TB: std_logic := '1';  -- Active low, synchronous reset
    signal P_TB:   std_logic_vector(DATA_WIDTH_TB-1 downto 0) := (others => '0');  -- Parallel input
    signal LOAD_TB: std_logic := '0';  -- Parallel Enable (Load)
    signal CEP_TB: std_logic := '0';  -- Count enable parallel input
    signal CET_TB: std_logic := '0'; -- Count enable trickle input
    signal Q_TB:   std_logic_vector(DATA_WIDTH_TB-1 downto 0);            			
    signal TC_TB:  std_logic;  -- Terminal Count
   
    
	
    signal check_signal:   std_logic_vector(DATA_WIDTH_TB-1 downto 0) := (others => '0');            			
    
    signal stop_simulation : integer := 0;
begin
    -- DUT INSTANTIATION
    DUT : Counter 	generic map (DATA_WIDTH_TB)
    				port map (-- can be A=>A and you understand
                                CLK => CLK_TB, 
                                RST => RST_TB,
                                P => P_TB,
                                LOAD => LOAD_TB,
                                CEP => CEP_TB,
                                CET => CET_TB,
                                Q => Q_TB,
                                TC => TC_TB);
	-- CLOCK GENERATOR
    CLOCK_GENERATOR : process
    begin
        CLK_TB <= '0';
        wait for CLOCK_PERIOD/2;
        CLK_TB <= '1';
        wait for CLOCK_PERIOD/2;
        if (stop_simulation = 1) then
            wait;
        end if;
    end process CLOCK_GENERATOR;
    
    --CLK_TB <= not clk_TB after CLOCK_PERIOD/2 when stop_simulation = 0 else '0';
   
    
    
    --RST_TB <= '1' , '0' after CLOCK_PERIOD; -- reset is deactivated for CLOCK_PERIOD then activated
    -- RST_TB <= '0' , '1' after CLOCK_PERIOD; -- reset is activated for CLOCK_PERIOD then deactivated 
    

    -- TIMULUS and CHECKING PROCESS
    STIM_CHECK_PROCESS : process
        variable i : integer := 0;
        variable output_line : line; 
    begin
        
        RST_TB <= '1';
        --wait for CLOCK_PERIOD;
        wait until falling_edge(CLK_TB);
        RST_TB <= '0';
        --wait for CLOCK_PERIOD;
        wait until falling_edge(CLK_TB);
        RST_TB <= '1';
        --wait for CLOCK_PERIOD;
        wait until falling_edge(CLK_TB);

        -- P_TB <= "01011010";
        P_TB <= "1010";
        LOAD_TB <= '0';
        CEP_TB <= '0'; 
        CET_TB <= '0';
        -- check_signal <= "01011010";
        check_signal <= "1010";
        
		wait until falling_edge(CLK_TB);
        --wait for CLOCK_PERIOD;
        --if (Q_TB /= "1010") then -- WORKED
        if (Q_TB /= check_signal) then
            report "FAILED = at time, COUNT " & time'image(now) & integer'image(i);
        else
            report "SUCCEEDLED = at time, COUNT " & time'image(now) & integer'image(i);
        end if;
        
        
        
        LOAD_TB <= '1';
        CEP_TB <= '1'; 
        CET_TB <= '1';
        
        for i in 0 to 2**DATA_WIDTH_TB-1 loop
            
            check_signal <= check_signal + 1;
            wait until falling_edge(CLK_TB);
            --wait for CLOCK_PERIOD;
            if (Q_TB /= check_signal) then
                report "FAILED = at time, COUNT " & time'image(now) & integer'image(i);
            else
                report "SUCCEEDLED = at time, COUNT " & time'image(now) & integer'image(i);
            end if;
        end loop;
        
        wait for 70 ns;
        stop_simulation <= 1;
        
        wait; -- wait forever to stop process from being repeated
    
    end process STIM_CHECK_PROCESS;
    
end architecture Counter_TB_Arch;