library ieee;
use ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;

entity addsub is
    generic (N : integer := 4);
    port(
		  clock,start : in std_logic;
        A,B : in std_logic_vector (N-1 downto 0);
        ctrl_M : in std_logic;
        s : out std_logic_vector (N-1 downto 0);
		  C,V : out std_logic;
		  DONE : out std_logic);
end addsub;

architecture struct of addsub is
	 type state_type is (s0,s1,s2);
	 signal state : state_type := s0;
	 
	 signal sum :std_logic_vector(N-1 downto 0) := (others => '0');
	 signal C_out : std_logic;
	 signal bit_counter : integer := 0;
	 signal x : std_logic_vector(N downto 0);
	 
	 begin
	 process(clock,start)
		begin
			if (rising_edge(clock)) then
				case state is
					when s0 =>
						if start = '1' then
							state <= s1;
							x(0) <= ctrl_M;
						else
							state <= s0;
							DONE <= '0';
						end if;
					when s1 =>
						if bit_counter < N+1 then
							state <= s2;
						else
							DONE <= '1';
							bit_counter <= 0;
							s <= sum;
							C <= x(N-1);
							V <= x(N) xor x(N-1);
							
							state <= s0;
							
						end if;
					when s2 =>
						sum(bit_counter) <= (A(bit_counter) xor (B(bit_counter) xor ctrl_M)) xor x(bit_counter);
						x(bit_counter+1) <= ((A(bit_counter) xor (B(bit_counter) xor ctrl_M)) and x(bit_counter)) or ((B(bit_counter) xor ctrl_M) and A(bit_counter));
						
						bit_counter <= (bit_counter+1);
						
						state <= s1;
				end case;
			end if;
	end process;
end struct;
							
							
						