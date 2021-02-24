library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity register_file_write_MUX is
  port (
	input_ALU_register: in std_logic_vector(15 downto 0) ;
	input_decoder: in std_logic_vector(15 downto 0) ;
	selector: in std_logic;

	output_register_file_write: out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- register_file_write_MUX

architecture register_file_write_MUX_arch of register_file_write_MUX is

begin

	--1: ALU register
	--0: decoder direct
	with (selector) select
		output_register_file_write <=
			input_ALU_register when '1',
			input_decoder when others;

end architecture ; -- register_file_write_MUX_arch

