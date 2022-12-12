----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:54:43 11/21/2020 
-- Design Name: 
-- Module Name:    FA - Behavioral 
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

entity FA is
	Port ( a : in STD_LOGIC;
	b : in STD_LOGIC;
	cin : in STD_LOGIC;
	s : out STD_LOGIC;
	cout : out STD_LOGIC);
end FA;

architecture Behavioral of FA is
	signal d1,d2,d3,d4 : STD_LOGIC;
begin
	d1<= a XOR b;
	d2<= a AND cin;
	d3<= b AND cin;
	d4<= b AND a;
	
	s<= d1 XOR cin;
	cout<=d2 OR c3 OR d4;
	
end Behavioral;
