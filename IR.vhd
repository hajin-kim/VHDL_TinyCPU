library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity IR is
  port (
	clock: in std_logic;
	reset: in std_logic;
	instr_in: in std_logic_vector(15 downto 0) ;

	instr_out: out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- IR

architecture IR_arch of IR is

	signal instr: std_logic_vector(15 downto 0) ;

begin
--output
	instr_out <= instr;

--D-FFs
	reg_d_ff : process( clock, reset )
	begin
	  if( reset = '1' ) then
	    instr <= "0000000000000000";
	  elsif( rising_edge(clock) ) then
		instr <= instr_in;
	  end if ;
	end process ; -- IR_d_ff

end architecture ; -- IR_arch

