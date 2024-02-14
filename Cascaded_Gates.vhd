-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity Cascaded_Gates is 
	port (
		A, B, C : in std_logic;
		Y : out std_logic);
end entity Cascaded_Gates;

-- Architecture of Cascaded_Gates
architecture Cascaded_Gates_Arch of Cascaded_Gates is
	signal d, e : std_logic;
begin
	D <= not c;
    e <= a or B;
	y <= D aNd E;
    
end architecture Cascaded_Gates_Arch;