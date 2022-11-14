library ieee;
use ieee.std_logic_1164.ALL;

entity calculator is 
	generic( N : integer := 5);
	port( clock,reset,start : in std_logic;
			A,B : in std_logic_vector( N-1 downto 0);
			ctrl : in std_logic_vector(1 downto 0) := (others => '0');
			
			DONE : out std_logic := '0';
			
			seven_seg_digit_1 : out STD_LOGIC_VECTOR (6 downto 0);
			seven_seg_digit_2 : out STD_LOGIC_VECTOR (6 downto 0);
			seven_seg_digit_3 : out STD_LOGIC_VECTOR (6 downto 0);
			seven_seg_digit_4 : out STD_LOGIC_VECTOR (6 downto 0);
			seven_seg_digit_5 : out STD_LOGIC_VECTOR (6 downto 0);
			seven_seg_digit_6 : out STD_LOGIC_VECTOR (6 downto 0));
			
end entity;

architecture converter of calculator is 

	signal BCD_data_digit_1 : std_logic_vector(3 downto 0);
	signal BCD_data_digit_2 : std_logic_vector(3 downto 0);
	signal BCD_data_digit_3 : std_logic_vector(3 downto 0);
	signal BCD_data_digit_4 : std_logic_vector(3 downto 0);
	signal BCD_data_digit_5 : std_logic_vector(3 downto 0);
	signal BCD_data_digit_6 : std_logic_vector(3 downto 0);
	
	signal remainder  : std_logic_vector(2*N downto 0) := (others => '0');
	
	signal C	: std_logic;
	signal V : std_logic;
	
	signal result_add : std_logic_vector(N downto 0) := (others => '0');
	signal result_sub : std_logic_vector(N downto 0) := (others => '0');
	signal result_mul : std_logic_vector(2*N-1 downto 0) := (others => '0');
	signal result_divide : std_logic_vector(N-1 downto 0) := (others => '0');
	
	signal add_DONE : std_logic;
	signal sub_DONE : std_logic;
	signal divide_DONE : std_logic;
	signal mul_DONE : std_logic;
	
	begin
		adder : entity work.addsub(struct)
					port map(clock => clock,
								start => not start,
								A => A,
								B => B,
								ctrl_M => '0',
								s => result_add,
								DONE => add_DONE,
								V => V);
		subtractor : entity work.addsub(struct)
					port map(clock => clock,
								start => not start,
								A => A,
								B => B,  
								ctrl_M => '1',
								s => result_sub,
								DONE => sub_DONE);
		divider : entity work.division(divide)
					port map(clock => clock,
								reset => not reset,
								start => not start,
								A => A,
								B => B,
								Q => result_divide,
								R => remainder,
								DONE => divide_DONE);
		multi : entity work.multiplication(behave)
					port map(clock => clock,
								reset => not reset,
								start => not start,
								A => A,
								B => B,
								R => result_mul,
								DONE => mul_DONE);
		
		convert_binary	    :	entity work.BCD_to_2digitDec(Behavioral)
									port map(
												C => C,
												reset => not reset,
												clock => clock,
												start => not start,
												ctrl => ctrl,
												
												V => V,
												
												A => A,
												B => B,
												
												result_add => result_add,
												result_sub => result_sub,
												result_mul => result_mul,
												result_divide => result_divide,
												remainder => remainder,
												
												add_DONE => add_DONE,
												sub_DONE => sub_DONE,
												mul_DONE => mul_DONE,
												divide_DONE => divide_DONE,
												
												DONE => DONE,
												
												BCD_digit_1 => BCD_data_digit_1,
												BCD_digit_2 => BCD_data_digit_2,
												BCD_digit_3 => BCD_data_digit_3,
												BCD_digit_4 => BCD_data_digit_4,
												BCD_digit_5 => BCD_data_digit_5,
												BCD_digit_6 => BCD_data_digit_6);
		
		seven_seg_display_1: entity work.BCD_to_7_segment(data_process)
									port map(
										clk_i => clock,
										BCD_i  => BCD_data_digit_1,
										seven_seg  =>seven_seg_digit_1 );
		seven_seg_display_2: entity work.BCD_to_7_segment(data_process)
									port map(
										clk_i => clock,
										BCD_i  => BCD_data_digit_2,
										seven_seg  =>seven_seg_digit_2);
		seven_seg_display_3: entity work.BCD_to_7_segment(data_process)
									port map(
										clk_i => clock,
										BCD_i  => BCD_data_digit_3,
										seven_seg  =>seven_seg_digit_3 );
		seven_seg_display_4: entity work.BCD_to_7_segment(data_process)
									port map(
										clk_i => clock,
										BCD_i  => BCD_data_digit_4,
										seven_seg  =>seven_seg_digit_4 );
		seven_seg_display_5: entity work.BCD_to_7_segment(data_process)
									port map(
										clk_i => clock,
										BCD_i  => BCD_data_digit_5,
										seven_seg  =>seven_seg_digit_5 );
		seven_seg_display_6: entity work.BCD_to_7_segment(data_process)
									port map(
										clk_i => clock,
										BCD_i  => BCD_data_digit_6,
										seven_seg  =>seven_seg_digit_6 );
end converter;