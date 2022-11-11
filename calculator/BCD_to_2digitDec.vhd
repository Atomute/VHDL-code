library ieee;
use ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;

entity BCD_to_2digitDec is
		Port ( clock  : in  std_logic;	-- system clock
             reset  : in  std_logic; 	-- synchronous reset, active-high
				 data 	: in  STD_LOGIC_VECTOR (3 downto 0);
				 ctrl	: in std_logic_vector(1 downto 0);
				 BCD_digit_1 : out STD_LOGIC_VECTOR (3 downto 0);
				 BCD_digit_2 : out STD_LOGIC_VECTOR (3 downto 0) );
					  
end BCD_to_2digitDec;

architecture Behavioral of BCD_to_2digitDec is
signal int_data_1 : integer := 0;
signal int_data_2 : integer:= 0;

	begin
		process(clock, reset, data)
			begin
				if (reset='1' ) then  
					int_data_1 <= 0;
					int_data_2 <= 0;
				elsif (clock'event and clock='1') then  
					int_data_1 <= conv_integer(unsigned(data)) mod 10;
					int_data_2 <= (conv_integer(unsigned(data))/ 10) mod 10;

				end if;
				
				BCD_digit_1 <= conv_std_logic_vector(int_data_1, 4);
				BCD_digit_2 <= conv_std_logic_vector(int_data_2, 4);
		end process;

		
end Behavioral;