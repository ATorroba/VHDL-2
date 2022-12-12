----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:51:56 11/21/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity ALU is
	Port ( 
    	a : in STD_LOGIC_VECTOR (7 downto 0);
		b : in STD_LOGIC_VECTOR (7 downto 0);
		control : in STD_LOGIC_VECTOR (2 downto 0);
		resultado : out STD_LOGIC_VECTOR (7 downto 0);
		error : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

	SIGNAL s : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL g1,g2,g3,g4,g5,g6,g7,g8 : STD_LOGIC;
	SIGNAL h1,h2,h3 : STD_LOGIC;
	signal ew : STD_LOGIC;
	signal p : STD_LOGIC_VECTOR(7 downto 0);
	signal Fcp : STD_LOGIC;

component CP
	port ( 
		e : in STD_LOGIC_VECTOR (7 downto 0);
	   y : out STD_LOGIC_VECTOR (2 downto 0);
	   idle : out STD_LOGIC);
end component;

component FA 
	port (
      a : in STD_LOGIC;
	   b : in STD_LOGIC;
	   cin : in STD_LOGIC;
	   s : out STD_LOGIC;
	   cout : out STD_LOGIC);
end component;

component ROM 
	port ( 
		addr : in STD_LOGIC_VECTOR (2 downto 0);
	   data : out STD_LOGIC_VECTOR (7 downto 0));
end component;

begin

COM1: FA
	port map (
		a => a(0),
		b => b(0) xor ew,
		cin => ew,
		s => s(0),
		cout => g1);

COM2: FA
	port map (
		a => a(1),
		b => b(1) xor ew,
		cin => g1,
		s => s(1),
		cout => g2);
			  
COM3: FA
	port map (
		a => a(2),
		b => b(2) xor ew,
		cin => g2,
		s => s(2),
		cout => g3);
			  
COM4: FA
	port map (
		a => a(3),
		b => b(3) xor ew,
		cin => g3,
		s => s(3),
		cout => g4);
			  
COM5: FA
	port map (
		a => a(4),
		b => b(4) xor ew,
		cin => g4,
		s => s(4),
		cout => g5);
			  
COM6: FA
	port map (
		a => a(5),
		b => b(5) xor ew,
		cin => g5,
		s => s(5),
		cout => g6);
			  
COM7: FA
	port map (
		a => a(6),
		b => b(6) xor ew,
		cin => g6,
		s => s(6),
		cout => g7);
			  
COM8: FA
	port map (
		a => a(7),
		b => b(7) xor ew,
		cin => g7,
		s => s(7),
		cout => g8);

COM9: CP
	port map (
		e(0) => a(0),
		e(1) => a(1),
		e(2) => a(2),
		e(3) => a(3),
		e(4) => a(4),
		e(5) => a(5),
		e(6) => a(6),
		e(7) => a(7),
		y(0) => h1,
		y(1) => h2,
		y(2) => h3,
		idle => Fcp);

COM10: ROM 
	port map (
		addr(0) => h1,
		addr(1) => h2,
		addr(2) => h3,
		data(0) => p(0),
		data(1) => p(1),
		data(2) => p(2),
		data(3) => p(3),
		data(4) => p(4),
		data(5) => p(5),
		data(6) => p(6),
		data(7) => p(7)); 

ew <= '1' when (control="101") else '0';	

with control select 
	error <= '0' when ("000"),
				'0' when ("001"),
				'0' when ("010"),
				'0' when ("011"),
				g7 xor g8 when ("100"),
				g7 xor g8 when ("101"),
				a(7) xor a(6) when ("110"), 
				a(7) or Fcp when ("111"), 
				'0'when others ;
			
with control select 
	resultado <= not(a) when ("000"), 
					 a nand b when "001" ,
					 a nor b when ("010") ,
					 a xnor b when ("011") , 
					 s when  ("100" ) , 
					 s when ("101") ,
					 a (6 downto 0) & '0' when ("110") , 
					 p when ("111"), 
					 "00000000" when others ;
					 
end Behavioral;

