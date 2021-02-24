library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity register_file is
  port (
	clock: in std_logic;
	reset: in std_logic;

--### OUTPUTS FOR TINY CPU ###--
	output0: out std_logic_vector(15 downto 0) ;
	output1: out std_logic_vector(15 downto 0) ;
	output2: out std_logic_vector(15 downto 0) ;
	output3: out std_logic_vector(15 downto 0) ;
	output4: out std_logic_vector(15 downto 0) ;
	output5: out std_logic_vector(15 downto 0) ;
	output6: out std_logic_vector(15 downto 0) ;
	output7: out std_logic_vector(15 downto 0) ;
	output8: out std_logic_vector(15 downto 0) ;
	output9: out std_logic_vector(15 downto 0) ;
	output10: out std_logic_vector(15 downto 0) ;
	output11: out std_logic_vector(15 downto 0) ;
	output12: out std_logic_vector(15 downto 0) ;
	output13: out std_logic_vector(15 downto 0) ;
	output14: out std_logic_vector(15 downto 0) ;
	output15: out std_logic_vector(15 downto 0) ;
--------------------------------

--read function
	read1_num: in std_logic_vector(3 downto 0) ;
	read2_num: in std_logic_vector(3 downto 0) ;
	data1: out std_logic_vector(15 downto 0) ;
	data2: out std_logic_vector(15 downto 0) ;	

--write function
	write_num: in std_logic_vector(3 downto 0) ;
	write_data: in std_logic_vector(15 downto 0)

  ) ;
end entity ; -- register_file

architecture register_file_arch of register_file is

	component general_register is
	  port (
		clock: in std_logic;
		reset: in std_logic;
		D: in std_logic_vector(15 downto 0) ;
		Q: out std_logic_vector(15 downto 0)
	  ) ;
	end component ; -- general_register

	signal reg_selector: std_logic_vector(15 downto 0) ;
	signal reg_clock: std_logic_vector(15 downto 0) ;

	signal reg_output0: std_logic_vector(15 downto 0) ;
	signal reg_output1: std_logic_vector(15 downto 0) ;
	signal reg_output2: std_logic_vector(15 downto 0) ;
	signal reg_output3: std_logic_vector(15 downto 0) ;
	signal reg_output4: std_logic_vector(15 downto 0) ;
	signal reg_output5: std_logic_vector(15 downto 0) ;
	signal reg_output6: std_logic_vector(15 downto 0) ;
	signal reg_output7: std_logic_vector(15 downto 0) ;
	signal reg_output8: std_logic_vector(15 downto 0) ;
	signal reg_output9: std_logic_vector(15 downto 0) ;
	signal reg_output10: std_logic_vector(15 downto 0) ;
	signal reg_output11: std_logic_vector(15 downto 0) ;
	signal reg_output12: std_logic_vector(15 downto 0) ;
	signal reg_output13: std_logic_vector(15 downto 0) ;
	signal reg_output14: std_logic_vector(15 downto 0) ;
	signal reg_output15: std_logic_vector(15 downto 0) ;

	signal ALL_GND: std_logic_vector(15 downto 0) ;


begin
--define constant signal
	ALL_GND <= "0000000000000000";


	reg_clock(0) <= reg_selector(0) AND clock;
	reg_clock(1) <= reg_selector(1) AND clock;
	reg_clock(2) <= reg_selector(2) AND clock;
	reg_clock(3) <= reg_selector(3) AND clock;
	reg_clock(4) <= reg_selector(4) AND clock;
	reg_clock(5) <= reg_selector(5) AND clock;
	reg_clock(6) <= reg_selector(6) AND clock;
	reg_clock(7) <= reg_selector(7) AND clock;
	reg_clock(8) <= reg_selector(8) AND clock;
	reg_clock(9) <= reg_selector(9) AND clock;
	reg_clock(10) <= reg_selector(10) AND clock;
	reg_clock(11) <= reg_selector(11) AND clock;
	reg_clock(12) <= reg_selector(12) AND clock;
	reg_clock(13) <= reg_selector(13) AND clock;
	reg_clock(14) <= reg_selector(14) AND clock;
	reg_clock(15) <= reg_selector(15) AND clock;


--general_register instances
	r0: general_register port map (
		clock => reg_clock(0),
		reset => reset,
		D => write_data,
		Q => reg_output0
	);
	r1: general_register port map (
		clock => reg_clock(1),
		reset => reset,
		D => write_data,
		Q => reg_output1
	);
	r2: general_register port map (
		clock => reg_clock(2),
		reset => reset,
		D => write_data,
		Q => reg_output2
	);
	r3: general_register port map (
		clock => reg_clock(3),
		reset => reset,
		D => write_data,
		Q => reg_output3
	);
	r4: general_register port map (
		clock => reg_clock(4),
		reset => reset,
		D => write_data,
		Q => reg_output4
	);
	r5: general_register port map (
		clock => reg_clock(5),
		reset => reset,
		D => write_data,
		Q => reg_output5
	);
	r6: general_register port map (
		clock => reg_clock(6),
		reset => reset,
		D => write_data,
		Q => reg_output6
	);
	r7: general_register port map (
		clock => reg_clock(7),
		reset => reset,
		D => write_data,
		Q => reg_output7
	);
	r8: general_register port map (
		clock => reg_clock(8),
		reset => reset,
		D => write_data,
		Q => reg_output8
	);
	r9: general_register port map (
		clock => reg_clock(9),
		reset => reset,
		D => write_data,
		Q => reg_output9
	);
	r10: general_register port map (
		clock => reg_clock(10),
		reset => reset,
		D => write_data,
		Q => reg_output10
	);
	r11: general_register port map (
		clock => reg_clock(11),
		reset => reset,
		D => write_data,
		Q => reg_output11
	);
	r12: general_register port map (
		clock => reg_clock(12),
		reset => reset,
		D => write_data,
		Q => reg_output12
	);
	r13: general_register port map (
		clock => reg_clock(13),
		reset => reset,
		D => write_data,
		Q => reg_output13
	);
	r14: general_register port map (
		clock => reg_clock(14),
		reset => reset,
		D => write_data,
		Q => reg_output14
	);
	r15: general_register port map (
		clock => reg_clock(15),
		reset => reset,
		D => write_data,
		Q => reg_output15
	);


--write: select general_register
	with (write_num) select
		reg_selector <=
			"0000000000000001" when "0000",
			"0000000000000010" when "0001",
			"0000000000000100" when "0010",
			"0000000000001000" when "0011",
			"0000000000010000" when "0100",
			"0000000000100000" when "0101",
			"0000000001000000" when "0110",
			"0000000010000000" when "0111",
			"0000000100000000" when "1000",
			"0000001000000000" when "1001",
			"0000010000000000" when "1010",
			"0000100000000000" when "1011",
			"0001000000000000" when "1100",
			"0010000000000000" when "1101",
			"0100000000000000" when "1110",
			"1000000000000000" when "1111",
			"0000000000000000" when others;


--read: select data1
	with (read1_num) select
		data1 <=
			reg_output0 when "0000",
			reg_output1 when "0001",
			reg_output2 when "0010",
			reg_output3 when "0011",
			reg_output4 when "0100",
			reg_output5 when "0101",
			reg_output6 when "0110",
			reg_output7 when "0111",
			reg_output8 when "1000",
			reg_output9 when "1001",
			reg_output10 when "1010",
			reg_output11 when "1011",
			reg_output12 when "1100",
			reg_output13 when "1101",
			reg_output14 when "1110",
			reg_output15 when "1111",
			ALL_GND when others;

--read: select data2
	with (read2_num) select
		data2 <=
			reg_output0 when "0000",
			reg_output1 when "0001",
			reg_output2 when "0010",
			reg_output3 when "0011",
			reg_output4 when "0100",
			reg_output5 when "0101",
			reg_output6 when "0110",
			reg_output7 when "0111",
			reg_output8 when "1000",
			reg_output9 when "1001",
			reg_output10 when "1010",
			reg_output11 when "1011",
			reg_output12 when "1100",
			reg_output13 when "1101",
			reg_output14 when "1110",
			reg_output15 when "1111",
			ALL_GND when others;


--### OUTPUTS FOR TINY CPU ###--
	output0 <= reg_output0;
	output1 <= reg_output1;
	output2 <= reg_output2;
	output3 <= reg_output3;
	output4 <= reg_output4;
	output5 <= reg_output5;
	output6 <= reg_output6;
	output7 <= reg_output7;
	output8 <= reg_output8;
	output9 <= reg_output9;
	output10 <= reg_output10;
	output11 <= reg_output11;
	output12 <= reg_output12;
	output13 <= reg_output13;
	output14 <= reg_output14;
	output15 <= reg_output15;
--------------------------------

end architecture ; -- register_file_arch

