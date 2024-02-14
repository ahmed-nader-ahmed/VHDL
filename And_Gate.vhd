-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity AND_Gate is 
	port ( -- 2 input And Gate
		A, B : in std_logic;
	    Y : out std_logic);
end entity and_gate; -- case insensitive

-- Architecture of AND_Gate
architecture AND_Gate_Arch of AND_Gate is
begin
	y <= A aNd B;
    
end architecture AND_Gate_Arch;