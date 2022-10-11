library ieee;
use ieee.std_logic_1164.ALL;

entity fulladder is
	port(
		A,B,C_in : in std_logic;
		sum,C_out : out std_logic);
end fulladder;

architecture data_flow of fulladder is 
	begin
		sum <= (A xor B) xor C_in;
		C_out <= ((A xor B) and C_in) or (B and A);
end data_flow;

library ieee;
use ieee.std_logic_1164.ALL;

entity addsub is
	port(
		A,B : in std_logic_vector (4 downto 0);
		ctrl_M : in std_logic;
		s : out std_logic_vector (4 downto 0);
		V,C : out std_logic);
end addsub;

architecture struct of addsub is
	component fulladder is
		port(
			A,B,C_in : in std_logic;
			sum,C_out : out std_logic);
	end component;
	
	signal C1,C2,C3,C4,C5 : std_logic;

	begin
		sum1 : fulladder port map(A(0),B(0) xor ctrl_M,ctrl_M,s(0),C1);
		sum2 : fulladder port map(A(1),B(1) xor ctrl_M,C1,s(1),C2);
		sum3 : fulladder port map(A(2),B(2) xor ctrl_M,C2,s(2),C3);
		sum4 : fulladder port map(A(3),B(3) xor ctrl_M,C3,s(3),C4);
		sum5 : fulladder port map(A(4),B(4) xor ctrl_M,C4,s(4),C5);
		C <= C5;
		V <= C5 xor C4;
		
end struct;
