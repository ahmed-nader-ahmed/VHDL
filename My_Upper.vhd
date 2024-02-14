-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity My_Upper is 
	port (
		A_My_Upper, B_My_Upper : in std_logic;
		Z_My_Upper : out std_logic);
end entity My_Upper;

-- Architecture of My_Upper
architecture My_Upper_Arch of My_Upper is
	component MY_Lower_OR 
		port(	A, B : in std_logic;
					z : out std_logic);
  	end component MY_Lower_OR;
begin
    MY_Lower_OR_INSTANTIATION_1 :  MY_Lower_OR port map(a => A_My_Upper,
    													b => b_My_Upper,
                                                        z => z_My_Upper);
    
end architecture My_Upper_Arch;