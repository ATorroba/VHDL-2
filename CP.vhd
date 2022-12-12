----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:52:42 11/21/2020 
-- Design Name: 
-- Module Name:    CP - Behavioral 
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

entity CP is
	Port ( e : in STD_LOGIC_VECTOR (7 downto 0);
	y : out STD_LOGIC_VECTOR (2 downto 0);
	idle : out STD_LOGIC);
end CP;

architecture Behavioral of CP is

	signal H: STD_LOGIC_VECTOR (7 downto 0);

begin

	idle<= NOT e(7) AND NOT e(6) AND NOT e(5) AND NOT e(4) AND NOT e(3) AND NOT e(2) AND NOT e(1) AND NOT e(0);
	H(7)<=e(7);
	H(6)<=NOT e(7) AND e(6);
	H(5)<=NOT e(7) AND NOT e(6) AND e(5); 
	H(4)<=NOT e(7) AND NOT e(6) AND NOT e(5) AND e(4);
	H(3)<=NOT e(7) AND NOT e(6) AND NOT e(5) AND NOT e(4) AND e(3);
	H(2)<=NOT e(7) AND NOT e(6) AND NOT e(5) AND NOT e(4) AND NOT e(3) AND e(2);
	H(1)<=NOT e(7) AND NOT e(6) AND NOT e(5) AND NOT e(4) AND NOT e(3 )AND NOT e(2) AND e(1);
	H(0)<=NOT e(7) AND NOT e(6) AND NOT e(5) AND NOT e(4) AND NOT e(3) AND NOT e(2) AND NOT e(1) AND e(0);
	y(2)<=(H(4) OR H(5) OR H(6) OR H(7));
	y(1)<=(H(2) OR H(3) OR H(6) OR H(7));
	y(0)<=(H(1) OR H(3) OR H(5) OR H(7));

end Behavioral;