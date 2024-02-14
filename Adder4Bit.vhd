-- Use Standard IEEE Library
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; -- for using +

-- Entity Port Declaration
entity Adder4Bit is 
    port (
        A, B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        Z : out std_logic_vector(3 downto 0);
        Cout : out std_logic);
end entity Adder4Bit;

-- Architecture of Adder4Bit
architecture Adder4Bit_Arch of Adder4Bit is
	signal OUT5BITS: std_logic_vector(4 downto 0);
begin
    OUT5BITS <= (('0' & A) + ('0' & B) + cin);
    z <= OUT5BITS(3 downto 0);
    cout <= OUT5BITS(4);
    
end architecture Adder4Bit_Arch;