library ieee;
use ieee.std_logic_1164.ALL;

entity calculator is 
	generic( N : integer := 4);
	port( clock,reset,start : in std_logic;
			A,B : in std_logic_vector( N-1 downto 0);
			ctrl : in std_logic_vector(1 downto 0) := (others => '0');
			
			DONE : out std_logic;
			result : buffer std_logic_vector(N-1 downto 0) := (others => '0');
			seven_seg_digit_1 : out STD_LOGIC_VECTOR (6 downto 0);
			seven_seg_digit_2 : out STD_LOGIC_VECTOR (6 downto 0) );
			
end entity;

architecture converter of calculator is 
	signal remainder : std_logic_vector(2*N downto 0) := (others => '0');
	signal BCD_data_digit_1 : std_logic_vector(3 downto 0);
	signal BCD_data_digit_2 : std_logic_vector(3 downto 0);
	
	signal result_add : std_logic_vector(N-1 downto 0) := (others => '0');
	signal result_sub : std_logic_vector(N-1 downto 0) := (others => '0');
	signal result_mul : std_logic_vector(N-1 downto 0) := (others => '0');
	signal result_divide : std_logic_vector(N-1 downto 0) := (others => '0');
	
	signal data_DONE : std_logic;
	
	begin
		adder : entity work.addsub(struct)
					port map(A => A,
								B => B,
								ctrl_M => '0',
								s => result_add);
		subtractor : entity work.addsub(struct)
					port map(A => A,
								B => B,
								ctrl_M => '1',
								s => result_sub);
		divider : entity work.division(divide)
					port map(clock => clock,
								reset => reset,
								start => start,
								A => A,
								B => B,
								Q => result_divide,
								R => remainder,
								DONE => data_DONE);
		
		selector : entity work.selector(convert)
					  port map(start => start,
								  reset => reset,
								  clock => clock,
								  ctrl => ctrl,
								  
								  add => result_add,
								  sub => result_sub,
								  mul => result_mul,
								  divide => result_divide,
								  
								  result => result,
								  remainder => remainder,
								  DONE => data_DONE);
		
		convert_binary	    :	entity work.BCD_to_2digitDec(Behavioral)
									port map(reset => reset,
												clock => clock,
												data => result,
												ctrl => ctrl,
												BCD_digit_1 => BCD_data_digit_1,
												BCD_digit_2 => BCD_data_digit_2);
		
		seven_seg_display_1: entity work.BCD_to_7_segment(data_process)
									port map(
										clk_i => clock,
										BCD_i  => BCD_data_digit_1,
										seven_seg  =>seven_seg_digit_1 );
		seven_seg_display_2: entity work.BCD_to_7_segment(data_process)
									port map(
										clk_i => clock,
										BCD_i  => BCD_data_digit_2,
										seven_seg  =>seven_seg_digit_2 );
end converter;