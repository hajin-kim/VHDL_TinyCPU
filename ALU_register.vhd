library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity ALU_register is
  port (
	clock: in std_logic;
	reset: in std_logic;
	ALU_result_in: in std_logic_vector(15 downto 0) ;

	ALU_result_out: out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- ALU_register

architecture ALU_register_arch of ALU_register is

	signal ALU_result: std_logic_vector(15 downto 0) ;

begin
--output
	ALU_result_out <= ALU_result;

--D-FFs
	register_d_ff : process( clock, reset )
	begin
	  if( reset = '1' ) then
	    ALU_result <= "0000000000000000";
	  elsif( rising_edge(clock) ) then
		ALU_result <= ALU_result_in;
	  end if ;
	end process ; -- ALU_register_d_ff

end architecture ; -- ALU_register_arch

