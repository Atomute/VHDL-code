library ieee;
use ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;

entity BCD_to_2digitDec is
		generic( N : integer := 5);
		Port ( clock  : in  std_logic;	
             reset  : in  std_logic;
				 start  : in  std_logic;
				 
				 ctrl	: in std_logic_vector(1 downto 0);
				 
				 V,C : in std_logic;
				 
				 A,B : in std_logic_vector( N-1 downto 0);
				 
				 result_add : in std_logic_vector(N downto 0) := (others => '0');
				 result_sub : in std_logic_vector(N downto 0) := (others => '0');
				 result_mul : in std_logic_vector(2*N-1 downto 0) := (others => '0');
				 result_divide : in std_logic_vector(N-1 downto 0) := (others => '0');
				 remainder : in std_logic_vector(2*N downto 0) := (others => '0');
				
				 add_DONE : in std_logic;
				 sub_DONE : in std_logic;
				 mul_DONE : in std_logic;
				 divide_DONE : in std_logic;
				 
				 DONE : out std_logic;
				 
				 BCD_digit_1 : out STD_LOGIC_VECTOR (3 downto 0);
				 BCD_digit_2 : out STD_LOGIC_VECTOR (3 downto 0);
				 BCD_digit_3 : out STD_LOGIC_VECTOR (3 downto 0);
				 BCD_digit_4 : out STD_LOGIC_VECTOR (3 downto 0);
				 BCD_digit_5 : out STD_LOGIC_VECTOR (3 downto 0);
				 BCD_digit_6 : out STD_LOGIC_VECTOR (3 downto 0));
					  
end BCD_to_2digitDec;

architecture Behavioral of BCD_to_2digitDec is
type state_type is (s0,s1);
signal state : state_type := s0;

signal data 	   : std_logic_vector(N-1 downto 0) := (others => '0');

signal int_data_1 : integer := 0;
signal int_data_2 : integer := 0;
signal int_data_3 : integer := 0;
signal int_data_4 : integer := 0;
signal int_data_5 : integer := 0;
signal int_data_6 : integer := 0;

signal zero : integer := 0;

	begin
		process(clock, reset, data)
			begin
				if (reset='1' ) then  
					int_data_1 <= 0;
					int_data_2 <= 0;
					int_data_3 <= 0;
					int_data_4 <= 0;
					int_data_5 <= 0;
					int_data_6 <= 0;
					
					state <= s0;
				elsif (rising_edge(clock)) then
					case state is
						when s0 =>
							if start ='1' then
								state <= s1;
							else
								BCD_digit_1 <= conv_std_logic_vector(int_data_1, 4);
								BCD_digit_2 <= conv_std_logic_vector(int_data_2, 4);
								BCD_digit_3 <= conv_std_logic_vector(int_data_3, 4);
								BCD_digit_4 <= conv_std_logic_vector(int_data_4, 4);
								BCD_digit_5 <= conv_std_logic_vector(int_data_5, 4);
								BCD_digit_6 <= conv_std_logic_vector(int_data_6, 4);
								
								DONE <= '0';
								state <= s0;
							end if;
						when s1 =>
							if ctrl ="11" then
								DONE <= add_DONE;
								if (C='1' and add_DONE = '1') then
									int_data_1 <= 10;
									int_data_2 <= 10;
									int_data_3 <= 10;
									int_data_4 <= 10;
									int_data_5 <= 10;
									int_data_6 <= 10;
									
									state <= s0;
								elsif (add_DONE = '1') then
									int_data_1 <= conv_integer(unsigned(result_add)) mod 10;
									int_data_2 <= (conv_integer(unsigned(result_add))/ 10) mod 10;
									int_data_3 <= conv_integer(unsigned(result_add))/100;
									int_data_4 <= 0;
									int_data_5 <= 0;
									int_data_6 <= 0;
									
									state <= s0;
								end if;
							elsif ctrl = "10" then
								DONE <= sub_DONE;
								if (A < B and sub_DONE = '1') then
									int_data_1 <= 10;
									int_data_2 <= 10;
									int_data_3 <= 10;
									int_data_4 <= 10;
									int_data_5 <= 10;
									int_data_6 <= 10;
									
									state <= s0;
								elsif (sub_DONE = '1') then
									int_data_1 <= conv_integer(unsigned(result_sub)) mod 10;
									int_data_2 <= (conv_integer(unsigned(result_sub))/ 10) mod 10;
									int_data_3 <= conv_integer(unsigned(result_sub))/100;
									int_data_4 <= 0;
									int_data_5 <= 0;
									int_data_6 <= 0;
																		
									state <= s0;
								end if;
							elsif ctrl = "01" then
								DONE <= mul_DONE;
								if (mul_DONE = '1') then
									int_data_1 <= conv_integer(unsigned(result_mul)) mod 10;
									int_data_2 <= (conv_integer(unsigned(result_mul))/ 10) mod 10;
									int_data_3 <= conv_integer(unsigned(result_mul))/100;
									int_data_4 <= 0;
									int_data_5 <= 0;
									int_data_6 <= 0;
																		
									state <= s0;
								end if;
							elsif ctrl = "00" then
								DONE <= divide_DONE;
								if (divide_DONE = '1') then
									int_data_1 <= conv_integer(unsigned(result_divide)) mod 10;
									int_data_2 <= (conv_integer(unsigned(result_divide))/ 10) mod 10;
									int_data_3 <= conv_integer(unsigned(result_divide))/100;
									int_data_4 <= conv_integer(unsigned(remainder)) mod 10;
									int_data_5 <= (conv_integer(unsigned(remainder))/ 10) mod 10;
									int_data_6 <= conv_integer(unsigned(remainder))/100;
																		
									state <= s0;
								end if;
							end if;
					end case;
				end if;
		end process;
end Behavioral;