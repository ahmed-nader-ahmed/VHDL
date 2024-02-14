-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;

-- Entity Port Declaration
entity MY_Lower_OR is
    port (
        A, B : in std_logic;
        Z : out std_logic);
end entity MY_Lower_OR;

-- Architecture of MY_Lower_OR
architecture MY_Lower_OR_Arch of MY_Lower_OR is
begin
    z <= a or B;
    
end architecture MY_Lower_OR_Arch;