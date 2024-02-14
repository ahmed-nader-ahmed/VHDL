-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;


-- Entity Port Declaration
entity LogicalOperators is 
    port (
        A, B, C, d : in std_logic;
        v_A, v_B : in std_logic_vector(3 downto 0);
        w, u, x, Y, z : out std_logic;
        v_x, v_Y : out std_logic_vector(3 downto 0));
end entity LogicalOperators;

-- Architecture of LogicalOperators
architecture LogicalOperators_Arch of LogicalOperators is
begin
	w <= A and B;
    u <= A nor B;
    x <= c xor d;
    y <= c xnor d;
	z <= (A and B) or (C and d);
    v_x <= v_A and v_B; -- vector bitwise
    v_y <= v_A or v_B; -- vector bitwise
    
end architecture LogicalOperators_Arch;