library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity FIFO8x9 is
   port(
      clk, rst:		in std_logic; -- rst ignored
      RdPtrClr, WrPtrClr:	in std_logic;    
      RdInc, WrInc:	in std_logic;
      DataIn:	 in std_logic_vector(8 downto 0);
      DataOut: out std_logic_vector(8 downto 0);
      rden, wren: in std_logic
	);
end entity FIFO8x9;

architecture RTL of FIFO8x9 is
--signal declarations
type fifo_array is array(7 downto 0) of std_logic_vector(8 downto 0);  -- makes use of VHDL’s enumerated type
signal fifo:  fifo_array;
signal wrptr, rdptr: unsigned(2 downto 0);
signal en: std_logic_vector(7 downto 0); --ignored
signal dmuxout: std_logic_vector(8 downto 0); --ignored

begin

   DataOut <= fifo(to_integer(unsigned(rdptr))) when (rden = '1') else (others => 'Z');

	fifo_process : process (clk)
	begin
      if (wren = '1') then
         fifo(to_integer(unsigned(wrptr))) <= DataIn;
		end if;
	end process fifo_process;

	write_process : process (clk)
    begin
         if WrPtrClr = '1' then wrptr <= (others => '0');
         elsif (rising_edge(clk)) then
            if (WrInc = '1') then
               wrptr <= wrptr + 1;
            end if;
         end if;
    end process write_process;

	read_process : process (clk)
    begin
         if RdPtrClr = '1' then rdptr <= (others => '0');
         elsif (rising_edge(clk)) then
            if (RdInc = '1') then
               rdptr <= rdptr + 1;
            end if;
         end if;
    end process read_process;

end architecture RTL;

