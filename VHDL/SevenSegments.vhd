-- SevenSegments.vhd

--****************************************************
--	Description: Get outputs for the 7 segments from 
--					 a 4-bit  input (just 1 digit)
--	
--	Inputs: [3:0] ones, number to be displayed
--	
--	Outputs: reg[6:0] segments, obtained through 
--				behavioral description. (low means ON)
--***************************************************/

-- Libraries

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity declaration

ENTITY SevenSegments IS

	PORT (
		binNumber : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		segmentLed : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

END SevenSegments;

-- Architecture definition

ARCHITECTURE Behavioral OF SevenSegments IS
BEGIN
	PROCESS (binNumber)
	BEGIN
		CASE binNumber IS
			WHEN "0000" =>
				segmentLed <= "1000000"; -- segment 0
			WHEN "0001" =>
				segmentLed <= "1111001"; -- segment 1
			WHEN "0010" =>
				segmentLed <= "0100100"; -- segment 2
			WHEN "0011" =>
				segmentLed <= "0110000"; -- segment 3
			WHEN "0100" =>
				segmentLed <= "0011001"; -- segment 4
			WHEN "0101" =>
				segmentLed <= "0010010"; -- segment 5
			WHEN "0110" =>
				segmentLed <= "0000010"; -- segment 6
			WHEN "0111" =>
				segmentLed <= "1111000"; -- segment 7
			WHEN "1000" =>
				segmentLed <= "0000000"; -- segment 8
			WHEN "1001" =>
				segmentLed <= "0011000"; -- segment 9
			WHEN "1010" =>
				segmentLed <= "0001000"; -- segment A
			WHEN "1011" =>
				segmentLed <= "0000011"; -- segment b
			WHEN "1100" =>
				segmentLed <= "1000110"; -- segment C
			WHEN "1101" =>
				segmentLed <= "0100001"; -- segment d
			WHEN "1110" =>
				segmentLed <= "0000110"; -- segment E
			WHEN "1111" =>
				segmentLed <= "0001110"; -- segment F
			WHEN OTHERS =>
				segmentLed <= "0111111"; -- segment -
		END CASE;
	END PROCESS;

END;