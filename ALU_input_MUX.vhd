library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity ALU_input_MUX is
  port (
  	input_register_file: in std_logic_vector(15 downto 0) ;
  	input_decoder: in std_logic_vector(15 downto 0) ;
	selector: in std_logic;

	output_ALU_input: out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- ALU_input_MUX

architecture ALU_input_MUX_arch of ALU_input_MUX is

begin

	--1: register file
	--0: immediate(decoder direct)
	with (selector) select
		output_ALU_input <=
			input_register_file when '1',
			input_decoder when others;

end architecture ; -- ALU_input_MUX_arch

