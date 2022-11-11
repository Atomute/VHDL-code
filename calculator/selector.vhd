library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity selector is
	generic( N : integer := 4);
	port( start,reset,clock : in std_logic;
			
			ctrl : in std_logic_vector(1 downto 0) := (others => '0');
			add,sub,mul,divide : in std_logic_vector(N-1 downto 0) := (others => '0');
			DONE : buffer std_logic;
			
			result : out std_logic_vector(N-1 downto 0) := (others => '0');
			remainder : buffer std_logic_vector(2*N downto 0) := (others => '0'));
end entity;

architecture convert of selector is
	signal data_DONE : std_logic;
	signal data_add  : std_logic_vector(N-1 downto 0) := (others => '0');
	signal data_sub  : std_logic_vector(N-1 downto 0) := (others => '0');
	signal data_mul  : std_logic_vector(N-1 downto 0) := (others => '0');
	signal data_divide  : std_logic_vector(N-1 downto 0) := (others => '0');
	signal data_ctrl : std_logic_vector(1 downto 0) := (others => '0');
	
	begin
	process(clock,reset,start)
		begin
			data_add <= add;
			data_sub <= sub;
			data_mul <= mul;
			data_divide <= divide;
			
			if (reset ='1') then
				result <= (others => '0');
				remainder <= (others => '0');
			elsif rising_edge(clock) then
				case ctrl is
					when "11" =>
						result <= data_add;
						DONE <= '1';
						remainder <= (others =>'0');
					when "10" =>
						result <= data_sub;
						DONE <= '1';
						remainder <= (others =>'0');
					when "01" =>
						if data_DONE = '1' then
							result <= data_mul;
							remainder <= (others => '0');
							DONE <= data_DONE;
						end if;
					when "00" =>
						if data_DONE = '0' then
							result <= data_mul;
							remainder <= remainder;
							DONE <= data_DONE;
						end if;
					when others => result <= (others => '0');
				end case;
			end if;
	end process;
end convert;
			