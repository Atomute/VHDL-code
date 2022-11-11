library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity division is 
	generic(N : integer := 4);
	port(clock  : in  std_logic;	-- system clock
        reset  : in  std_logic; 	-- synchronous reset, active-high
		  start	: in  std_logic;
		  A,B		: in  std_logic_vector(N-1 downto 0) := (others => '0');
		  Q		: out std_logic_vector(N-1 downto 0) := (others => '0');  -- quotient
		  R		: out std_logic_vector(2*N downto 0) := (others => '0');	-- remainer
		  DONE	: out std_logic
		);
end division;

architecture divide of division is
	type state_type is (s0,s1,s2);
	
	signal DATA_divisor	: std_logic_vector(2*N downto 0) := (others => '0');
	signal DATA_remainder : std_logic_vector(2*N downto 0) := (others => '0');
	signal DATA_quotient : std_logic_vector(N-1 downto 0) := (others => '0');
	
	signal DATA_DONE : std_logic := '0';

	signal bit_counter : integer := 0;
	signal state : state_type := s0;
	
	begin
	process(clock,reset,start)
		begin
			if (reset ='1') then
				DATA_divisor <= (others => '0');
				DATA_remainder <= (others => '0');
				DATA_quotient <= (others => '0');
			elsif rising_edge(clock) then
				case state is
					when s0 =>
						if (start ='1') then
							DATA_remainder(N-1 downto 0) <= A;
							DATA_divisor(2*N-1 downto N) <= B;
							
							state <= s1;
						else
							DONE <= '0';
							state <= s0;
						end if;
					when s1 =>
						if (bit_counter < (N+1)) then
							DATA_remainder <= DATA_remainder-DATA_divisor;
							
							state <= s2;
						else
							DONE <= '1';
							bit_counter <= 0;
							Q <= DATA_quotient;
							R <= DATA_remainder;
							DATA_divisor <= (others => '0');
							DATA_remainder <= (others => '0');
							DATA_divisor <= (others => '0');
							DATA_quotient <= (others => '0');
							
							state <= s0;
						end if;
					when s2 =>
						if (DATA_remainder(2*N) = '1') then
							DATA_remainder <= DATA_remainder+DATA_divisor;
							
							DATA_quotient <= DATA_quotient(N-2 downto 0) & '0';
							DATA_divisor <= '0' & DATA_divisor(2*N downto 1);
							bit_counter <= (bit_counter+1);
							
							state <= s1;
						else
							DATA_remainder <= DATA_remainder;
							
							DATA_quotient <= DATA_quotient(N-2 downto 0) & '1';
							DATA_divisor <= '0' & DATA_divisor(2*N downto 1);
							bit_counter <= (bit_counter+1);
							
							state <= s1;
						end if;
				end case;
			end if;
	end process;						
end divide;