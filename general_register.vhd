library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity general_register is
  port (
	clock: in std_logic;
	reset: in std_logic;
	D: in std_logic_vector(15 downto 0) ;
	Q: out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- general_register

architecture register_arch of general_register is

	signal data: std_logic_vector(15 downto 0) ;

begin
--output data
	Q <= data;

--D-FFs
	reg_d_ff : process( clock, reset )
	begin
	  if( reset = '1' ) then
	    data <= "0000000000000000";
	  elsif( rising_edge(clock) ) then
		data <= D;
	  end if ;
	end process ; -- reg_d_ff

end architecture ; -- register_arch

