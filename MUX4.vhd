-- ------------------------------------------------------------------------------------------------
-- -- First Way
-- ------------------------------------------------------------------------------------------------

-- -- Use Standard IEEE Library
-- library IEEE;
-- use IEEE.std_logic_1164.all;

-- -- Entity Port Declaration
-- entity MUX4 is 
--    port (
--        A, b, c, D : in std_logic_vector(3 downto 0);
--        s : in std_logic_vector(1 downto 0);
--        x : out std_logic_vector(3 downto 0));
-- end entity MUX4;

-- -- Architecture of MUX4
-- architecture MUX4_Arch of MUX4 is
-- begin
-- 	with s select x <= 
--     		a when "00",
--         	b when "01",
--             c when "10",
--             d when "11",
--             d when others;
    
-- end architecture MUX4_Arch;

-- ------------------------------------------------------------------------------------------------
-- -- Second Way
-- ------------------------------------------------------------------------------------------------

-- -- Use Standard IEEE Library
-- library IEEE;
-- use IEEE.std_logic_1164.all;

-- -- Entity Port Declaration
-- entity MUX4 is 
--    port (
--        A, b, c, D : in std_logic_vector(3 downto 0);
--        s : in std_logic_vector(1 downto 0);
--        x : out std_logic_vector(3 downto 0));
-- end entity MUX4;

-- -- Architecture of MUX4
-- architecture MUX4_Arch of MUX4 is
-- begin
-- 	x <= 		a when (s="00") else 
--     			b when (s="01") else
--                 c when (s="10") else
--                 d when (s="11") else
--                 d;
    
-- end architecture MUX4_Arch;


------------------------------------------------------------------------------------------------
-- Third Way
------------------------------------------------------------------------------------------------

-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity MUX4 is 
    port (
        A, b, c, D : in std_logic_vector(3 downto 0);
        s : in std_logic_vector(1 downto 0);
        x : out std_logic_vector(3 downto 0));
end entity MUX4;

-- Architecture of MUX4
architecture MUX4_Arch of MUX4 is
begin
	SELECT_PROCESS : process (a, b, c, d, s)
    begin
    	if 		s = "00" 	then 	x <= a;
        elsif 	s = ("01") 	then 	x <= b;
        elsif 	s = ("10") 	then 	x <= c;
        elsif 	s = ("11") 	then 	x <= d;
        else						x <= d;
        end if;
        
    end process SELECT_PROCESS;
    
end architecture MUX4_Arch;