----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:54:03 11/21/2020 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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
entity ROM is
	Port ( addr : in STD_LOGIC_VECTOR (2 downto 0);
	data : out STD_LOGIC_VECTOR (7 downto 0));
end ROM;

architecture Behavioral of ROM is

	begin 
	
	with addr select
	
	data <= "00000000" when "000",
			  "00000001" when "001",
			  "00000101" when "010",
			  "00001111" when "011",
			  "00100000" when "100",
			  "00110111" when "101",
			  "01011000" when "110",
			  "10000001" when "111";

end Behavioral;


