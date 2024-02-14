-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all; -- to declare unsigned or unsigned casting or to_integer casting
use ieee.std_logic_textio.all;
use std.textio.all;

-- Entity Port Declaration
entity DPRAM is 
	generic (
    	DATA_WIDTH : integer := 8;
        ADDRESS_WIDTH : integer := 10);
    port (
        W_DATA : in std_logic_vector(DATA_WIDTH-1 downto 0);
        W_ADDR, R_ADDR : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
        CLK, RST, wr_EN, rd_EN : in std_logic;
        R_DATA : out std_logic_vector(DATA_WIDTH-1 downto 0));
end entity DPRAM;

-- Architecture of DPRAM
architecture DPRAM_Arch of DPRAM is
	type MEM_TYPE is array (0 to 2**ADDRESS_WIDTH - 1) of std_logic_vector (DATA_WIDTH-1 downto 0);
    
    
    -- read_file function takes txt file inside string called txt_file,
    -- return data type is MEM_TYPE
    impure function read_file(txt_file : in string) return MEM_TYPE is
		-- declare variable ram_file of file data type to read file given to function
      file ram_file : text open read_mode is txt_file;
      variable txt_line : line;
      variable txt_bit : bit_vector(31 downto 0);
      variable txt_ram : MEM_TYPE;

      begin for i in MEM_TYPE'range loop
      	-- read line specified by for loop from ram_file and output this line into txt_line
        readline(ram_file, txt_line);
        -- read txt_line and output what is read in txt_bit
        read(txt_line, txt_bit); --hread for hexadecimal
        -- assign txt_bit to txt_ram(i) 
        txt_ram(i) := to_stdlogicvector(txt_bit); -- to_stdlogicvector bec. in MEM_TYPE the width was declared std_logic_vector
        -- := not <=
      end loop;

	 return txt_ram;

	end function;
    
    signal MEM : MEM_TYPE := read_file("INITIAL_RAM.txt");
    
    -- ---------------------------------
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
    
    
end architecture DPRAM_Arch;