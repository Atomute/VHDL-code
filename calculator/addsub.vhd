library ieee;
use ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;

entity addsub is
    generic (N : integer := 5);
    port(
		  clock,start : in std_logic;
        A,B : in std_logic_vector (N-1 downto 0);
        ctrl_M : in std_logic;
        s : out std_logic_vector (N downto 0) := (others => '0');
		  C,V : out std_logic;
		  DONE : out std_logic);
end addsub;

architecture struct of addsub is
	 type state_type is (s0,s1,s2);
	 signal state : state_type := s0;
	 
	 signal sum :std_logic_vector(N downto 0) := (others => '0');
	 signal C_out : std_logic;
	 signal bit_counter : integer := 0;
	 signal x : std_logic_vector(N+1 downto 0);
	 
	 signal data_A : std_logic_vector(N downto 0) := (others => '0');
	 signal data_B : std_logic_vector(N downto 0) := (others => '0');
	 
	 begin
	 process(clock,start)
		begin
			if (rising_edge(clock)) then
				case state is
					when s0 =>
						if start = '1' then
							state <= s1;
							x(0) <= ctrl_M;
							data_A(N-1 downto 0) <= A;
							data_B(N-1 downto 0) <= B;
						else
							state <= s0;
							DONE <= '0';
							data_A <= (others => '0');
							data_B <= (others => '0');
						end if;
					when s1 =>
						if bit_counter < N+2 then
							state <= s2;
						else
							DONE <= '1';
							bit_counter <= 0;
							s <= sum;
							C <= x(N);
							V <= x(N+1) xor x(N);
							
							state <= s0;
							
						end if;
					when s2 =>
						sum(bit_counter) <= (data_A(bit_counter) xor (data_B(bit_counter) xor ctrl_M)) xor x(bit_counter);
						x(bit_counter+1) <= ((data_A(bit_counter) xor (data_B(bit_counter) xor ctrl_M)) and x(bit_counter)) or ((data_B(bit_counter) xor ctrl_M) and data_A(bit_counter));
						
						bit_counter <= (bit_counter+1);
						
						state <= s1;
				end case;
			end if;
	end process;
end struct;
							
							
						