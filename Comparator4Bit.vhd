-- ------------------------------------------------------------------------------------------------
-- -- STRUCTURAL MODELLING 1
-- ------------------------------------------------------------------------------------------------

-- -- Use Standard IEEE Library
-- library IEEE;
-- use IEEE.std_logic_1164.all;

-- -- Entity Port Declaration
-- entity Comparator4Bit is 
--	port (
--		A, b : in std_logic_vector(3 downto 0);
--		Result : out std_logic);
-- end entity Comparator4Bit;

-- -- Architecture of Comparator4Bit
-- architecture Comparator4Bit_Arch of Comparator4Bit is
-- begin
-- 	result <= not(A(3) xor B(3)) and
--               not(A(2) xor B(2)) and
--               not(A(1) xor B(1)) and
--               not(A(0) xor B(0));
    
-- end architecture Comparator4Bit_Arch;


-- ------------------------------------------------------------------------------------------------
-- -- STRUCTURAL MODELLING 2 did not work
-- ------------------------------------------------------------------------------------------------

-- -- Use Standard IEEE Library
-- library IEEE;
-- use IEEE.std_logic_1164.all;

-- -- Entity Port Declaration
-- entity Comparator4Bit is 
--	port (
--		A, b : in std_logic_vector(3 downto 0);
--		Result : out std_logic);
-- end entity Comparator4Bit;

-- -- gatespackage
-- use work.gatespkg.all;

-- -- Architecture of Comparator4Bit
-- architecture Comparator4Bit_Arch of Comparator4Bit is
--   signal x: std_logic_vector(3 downto 0);
-- begin
-- 	u3 : xnor2 port map (a(3), B(3), X(3));
--     u2 : xnor2 port map (a(2), B(2), X(2));
--     u1 : xnor2 port map (a(1), B(1), X(1));
--     u0 : xnor2 port map (a(0), B(0), X(0));
    
--     u4 : and4 port map (x(3), x(2), X(1), x(0), result);
-- end architecture Comparator4Bit_Arch;



------------------------------------------------------------------------------------------------
-- DATAFLOW MODELLING 1
------------------------------------------------------------------------------------------------

-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- -- Entity Port Declaration
-- entity Comparator4Bit is 
--	port (
--		A, b : in std_logic_vector(3 downto 0);
--		Result : out std_logic);
-- end entity Comparator4Bit;


-- Architecture of Comparator4Bit
architecture Comparator4Bit_Arch of Comparator4Bit is
begin
	result <= '1' when (A=b) else '0';
end architecture Comparator4Bit_Arch;


------------------------------------------------------------------------------------------------
-- BEHAVIORAL MODELLING 1
------------------------------------------------------------------------------------------------

-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- -- Entity Port Declaration
-- entity Comparator4Bit is 
--	port (
--		A, b : in std_logic_vector(3 downto 0);
--		Result : out std_logic);
-- end entity Comparator4Bit;


-- Architecture of Comparator4Bit
architecture Comparator4Bit_Arch of Comparator4Bit is
begin
	COMPARE_PROCESS : process(A,b)
    begin
    	if (A = b) then
        	result <= '1';
        else
        	result <= '0';
        end if;
    end process COMPARE_PROCESS;
end architecture Comparator4Bit_Arch;