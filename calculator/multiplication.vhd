library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity multiplication is 
	generic(N : integer := 5);
	port(clock  : in  std_logic;	-- system clock
        reset  : in  std_logic; 	-- synchronous reset, active-high
		  start	: in  std_logic;
		  A,B		: in  std_logic_vector(N-1 downto 0) := (others => '0');
		  R		: out std_logic_vector(2*N-1 downto 0) := (others => '0');	-- result
		  DONE	: out std_logic := '0' );
end multiplication ;

architecture behave of multiplication is
	type state_type is (s0,s1);
	signal DATA_A	: std_logic_vector(2*N-1 downto 0) := (others => '0');
	signal DATA_B : std_logic_vector(N-1 downto 0) := (others => '0');
	signal DATA_poduct : std_logic_vector(2*N-1 downto 0) := (others => '0');
	signal DATA_DONE : std_logic := '0';
	signal bit_counter : integer := 0;
	signal state : state_type := s0;
	
	begin
	process(clock,reset,start)
		begin
			if (reset ='1') then
				state <= s0;
				DATA_A <= (others => '0');
				DATA_B <= (others => '0');
				DATA_poduct <= (others => '0');
				R <= (others => '0');
				
			elsif rising_edge(clock) then
				case state is
					when s0 =>
						if (start ='1') then
							DATA_A(N-1 downto 0) <= A;
							DATA_B <= B;
							state <= s1;
						else
							DONE <= '0';
							state <= s0;
						end if;
					when s1 =>
						if (bit_counter < (N+1)) then
							state <= s1;
							if DATA_B(bit_counter) = '1' then
								DATA_poduct<= DATA_poduct + DATA_A;
								DATA_A <= std_logic_vector(shift_left(unsigned(DATA_A), 1));
								R <= DATA_poduct;
								bit_counter <= (bit_counter+1);
							else 
								DATA_A <= std_logic_vector(shift_left(unsigned(DATA_A), 1));
								R <= DATA_poduct;
								bit_counter <= (bit_counter+1);
							end if;
						else
							DONE <= '1';
							bit_counter <= 0;
							DATA_poduct <= (others => '0');
							DATA_A <= (others => '0');
							DATA_B <= (others => '0');
							state <= s0;
						end if;
					when others =>
						state <= s0;
				end case;
			end if;
	end process;						
end behave;