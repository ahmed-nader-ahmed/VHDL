-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_misc.all; -- needed for _REDUce


-- Entity Port Declaration
entity LogicalOperators is 
    port (
        v_A, v_B, v_c, v_D : in std_logic_vector(3 downto 0);
        w, u, x, Y, z : out std_logic);
end entity LogicalOperators;

-- Architecture of LogicalOperators
architecture LogicalOperators_Arch of LogicalOperators is
begin
	w <= AND_REDUCe(v_a);
    u <= NOR_REDUCe(v_b);
    x <= XOR_REDUCE(v_d);
    y <= OR_REDUCE(v_a) and v_b(0);
	z <= OR_REDUCE(v_b and v_a);
    
end architecture LogicalOperators_Arch;


-- -- Use Standard IEEE Library
-- library IEEE;
-- use IEEE.std_logic_1164.all;
-- -- use IEEE.std_logic_misc.all;


-- Entity Port Declaration
entity LogicalOperators is 
    port (
        v_A, v_B, v_c, v_D : in std_logic_vector(3 downto 0);
        w, u, x, Y, z : out std_logic);
end entity LogicalOperators;

-- -- Architecture of LogicalOperators
-- architecture LogicalOperators_Arch of LogicalOperators is
-- begin
-- 	w <= and(v_a);
--     u <= NOR(v_b);
--     x <= xor(v_d);
--     y <= or(v_a) and v_b(0);
-- 	z <= OR(v_b and v_a);
    
-- end architecture LogicalOperators_Arch;