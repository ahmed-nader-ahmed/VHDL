-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all; -- to declare unsigned or unsigned casting or to_integer casting

-- Entity Port Declaration
entity RegFile is 
	generic (
		DATA_WIDTH : integer := 8;
		ADDRESS_WIDTH : integer := 2);
    port (
        W_DATA : in std_logic_vector(DATA_WIDTH-1 downto 0);
        W_ADDR, R_ADDR : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
        CLK, RST, wr_EN, rd_EN : in std_logic;
        R_DATA : out std_logic_vector(DATA_WIDTH-1 downto 0));
end entity RegFile;

-- Architecture of RegFile
architecture RegFile_Arch of RegFile is
	type MEM_TYPE is array (0 to 2**ADDRESS_WIDTH - 1) of std_logic_vector (DATA_WIDTH-1 downto 0);
    signal MEM : MEM_TYPE;
begin
    REGISTERING_PROCESS : process (CLK, RST) -- ASYNC POSITIVE RESET
    	variable i : integer := 0; -- must put to avoid error
    begin
    	if (RST = '1') then
        	R_DATA <= (others => '0');
            while (i < 2**ADDRESS_WIDTH) loop
            	MEM(i) <= (others => '0');
                i := i + 1;
            end loop;
        elsif (rising_edge(CLK)) then
        	if (wr_en = '1') then
				MEM(to_integer(unsigned(W_ADDR))) <= W_DATA;
            elsif (rd_en = '1') then
				R_DATA <= MEM(to_integer(unsigned(R_ADDR)));
          	end if;
                
        end if;
    end process REGISTERING_PROCESS;
			
end architecture RegFile_Arch;
