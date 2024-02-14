library ieee;
use ieee.std_logic_1164.all;

entity FSM is
generic (
   A : std_logic_vector(1 downto 0) := "00";
   B : std_logic_vector(1 downto 0) := "01";
   C : std_logic_vector(1 downto 0) := "10");
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;


architecture FSM_arch of FSM is

signal current_state, next_state : std_logic_vector(1 downto 0);
begin

   comb_process : process (current_state, In1, next_state)
   begin
      case (current_state) is
         when A =>
            Out1 <= '0';
            if (In1 = '1') then
               next_state <= B;
            else
               next_state <= A;
            end if;
         when B =>
            Out1 <= '0';
            if (In1 = '0') then
               next_state <= C;
            else
               next_state <= B;
            end if;
         when C =>
            Out1 <= '1';
            if (In1 = '1') then
               next_state <= A;
            else
               next_state <= C;
            end if;
         when others => Out1 <= '0'; next_state <= A;
      end case;
   end process comb_process;

   clk_process : process (CLK, RST)
   begin
      if (RST = '1') then current_state <= A;
      elsif (rising_edge(CLK)) then current_state <= next_state;
      end if;
   end process clk_process;

   

end architecture FSM_arch;



