-- ModuleDivision_FSM.vhd

--***********************************************************************
--	Description: Block to get a single digit within a 16 bin value
--				 by performing a division and a module operation.
--	Example:
--				In -> number 54231, divider 100, module 10 (16-bit/each)
--				Out -> result 2 (4 bit output)  
--	
--	Inputs: 
--				number [15:0]; Base number to operate,
--				divider [15:0]; Division to be performed,
--				module [15:0]; Module to be performed,
--					
--	Outputs: 	result [3:0], {result = (number/divider) % module.}
--***********************************************************************

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ModuleDivision IS
	PORT (
		number : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		divider : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		module : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

	);
END ModuleDivision;

ARCHITECTURE Behavioral OF ModuleDivision IS

	SIGNAL numberSignal : INTEGER RANGE 0 TO 65535 := 1;
	SIGNAL dividerSignal : INTEGER RANGE 0 TO 65535 := 1;
	SIGNAL moduleSignal : INTEGER RANGE 0 TO 65535 := 1;

	SIGNAL resultSignal : NATURAL RANGE 0 TO 9 := 1;

BEGIN

	PROCESS (number)
	BEGIN
		-- Conversions to integer variable
		numberSignal <= to_integer(unsigned(number));
		dividerSignal <= to_integer(unsigned(divider));
		moduleSignal <= to_integer(unsigned(module));

		-- Actual operation	
		resultSignal <= (numberSignal/dividerSignal) MOD moduleSignal;

		-- Conversion to logic vector
		result <= STD_LOGIC_VECTOR(to_unsigned(resultSignal, result'LENGTH));

	END PROCESS;

END Behavioral;