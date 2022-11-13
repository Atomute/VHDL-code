library ieee;
use ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;

entity BCD_to_2digitDec is
		generic( N : integer := 4);
		Port ( clock  : in  std_logic;	
             reset  : in  std_logic;
				 start  : in  std_logic;
				 
				 ctrl	: in std_logic_vector(1 downto 0);
				 
				 V,C : in std_logic;
				 
				 A,B : in std_logic_vector( N-1 downto 0);
				 
				 result_add : in std_logic_vector(N-1 downto 0) := (others => '0');
				 result_sub : in std_logic_vector(N-1 downto 0) := (others => '0');
				 result_mul : in std_logic_vector(N-1 downto 0) := (others => '0');
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
					BCD_digit_1 <= conv_std_logic_vector(zero, 4);
					BCD_digit_2 <= conv_std_logic_vector(zero, 4);
					BCD_digit_3 <= conv_std_logic_vector(zero, 4);
					BCD_digit_4 <= conv_std_logic_vector(zero, 4);
					BCD_digit_5 <= conv_std_logic_vector(zero, 4);
					BCD_digit_6 <= conv_std_logic_vector(zero, 4);
				elsif (rising_edge(clock)) then
					case state is
						when s0 =>
							if start ='1' then
								state <= s1;
							else
								DONE <= '0';
								state <= s0;
							end if;
						when s1 =>
							case ctrl is
								when "11" =>
									if (V='1') then
										int_data_1 <= 10;
										int_data_2 <= 10;
										int_data_3 <= 10;
										int_data_4 <= 10;
										int_data_5 <= 10;
										int_data_6 <= 10;
									else
										int_data_1 <= conv_integer(unsigned(result_add)) mod 10;
										int_data_2 <= (conv_integer(unsigned(result_add))/ 10) mod 10;
										int_data_3 <= conv_integer(unsigned(result_add))/100;
										int_data_4 <= 0;
										int_data_5 <= 0;
										int_data_6 <= 0;
									end if;
									DONE <= add_DONE;
									BCD_digit_1 <= conv_std_logic_vector(int_data_1, 4);
									BCD_digit_2 <= conv_std_logic_vector(int_data_2, 4);
									BCD_digit_3 <= conv_std_logic_vector(int_data_3, 4);
									BCD_digit_4 <= conv_std_logic_vector(int_data_4, 4);
									BCD_digit_5 <= conv_std_logic_vector(int_data_5, 4);
									BCD_digit_6 <= conv_std_logic_vector(int_data_6, 4);
									
									
								when "10" =>
									if (A < B) then
										int_data_1 <= 10;
										int_data_2 <= 10;
										int_data_3 <= 10;
										int_data_4 <= 10;
										int_data_5 <= 10;
										int_data_6 <= 10;
									else
										int_data_1 <= conv_integer(unsigned(result_sub)) mod 10;
										int_data_2 <= (conv_integer(unsigned(result_sub))/ 10) mod 10;
										int_data_3 <= conv_integer(unsigned(result_sub))/100;
										int_data_4 <= 0;
										int_data_5 <= 0;
										int_data_6 <= 0;
									end if;
									DONE <= sub_DONE;
									BCD_digit_1 <= conv_std_logic_vector(int_data_1, 4);
									BCD_digit_2 <= conv_std_logic_vector(int_data_2, 4);
									BCD_digit_3 <= conv_std_logic_vector(int_data_3, 4);
									BCD_digit_4 <= conv_std_logic_vector(int_data_4, 4);
									BCD_digit_5 <= conv_std_logic_vector(int_data_5, 4);
									BCD_digit_6 <= conv_std_logic_vector(int_data_6, 4);
									
								when "01" =>
									int_data_1 <= conv_integer(unsigned(data)) mod 10;
									int_data_2 <= (conv_integer(unsigned(data))/ 10) mod 10;
									int_data_3 <= conv_integer(unsigned(data))/100;
									int_data_4 <= 0;
									int_data_5 <= 0;
									int_data_6 <= 0;
									
									BCD_digit_1 <= conv_std_logic_vector(int_data_1, 4);
									BCD_digit_2 <= conv_std_logic_vector(int_data_2, 4);
									BCD_digit_3 <= conv_std_logic_vector(int_data_3, 4);
									BCD_digit_4 <= conv_std_logic_vector(int_data_4, 4);
									BCD_digit_5 <= conv_std_logic_vector(int_data_5, 4);
									BCD_digit_6 <= conv_std_logic_vector(int_data_6, 4);
								when "00" =>
									int_data_1 <= conv_integer(unsigned(result_divide)) mod 10;
									int_data_2 <= (conv_integer(unsigned(result_divide))/ 10) mod 10;
									int_data_3 <= conv_integer(unsigned(result_divide))/100;
									int_data_4 <= conv_integer(unsigned(remainder)) mod 10;
									int_data_5 <= (conv_integer(unsigned(remainder))/ 10) mod 10;
									int_data_6 <= conv_integer(unsigned(remainder))/100;
									
									BCD_digit_1 <= conv_std_logic_vector(int_data_1, 4);
									BCD_digit_2 <= conv_std_logic_vector(int_data_2, 4);
									BCD_digit_3 <= conv_std_logic_vector(int_data_3, 4);
									BCD_digit_4 <= conv_std_logic_vector(int_data_4, 4);
									BCD_digit_5 <= conv_std_logic_vector(int_data_5, 4);
									BCD_digit_6 <= conv_std_logic_vector(int_data_6, 4);
									DONE <= divide_DONE;
								end case;
							end case;
						end if;
		end process;
end Behavioral;