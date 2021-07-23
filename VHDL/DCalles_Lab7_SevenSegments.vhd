-- DCalles_Lab7_7Segments.vhd

--***********************************************************************
--	Description: The value of a 16-bit counter is showed through 5 
--				7-segments displays as an unsigned decimal.
--				The input frequency of the counter can be controled
--				through the clkFactor 10-bit input.
--	
--	Inputs: 	clk; clock signal.
--				reset; active-low reset signal.
--				clkFactor [9:0]; prescalar for the clock input of the
--								 counter	
--					
--	Outputs: 	
--				segment0 [6:0]; Least significative 7-segments digit
--				segment1 [6:0]; .
--				segment2 [6:0]; .
--				segment3 [6:0]; .
--				segment4 [6:0]; Most significative 7-segments digit
--***********************************************************************

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity declaration

ENTITY DCalles_Lab7_SevenSegments IS

	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		clkFactor : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		segment0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		segment1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		segment2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		segment3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		segment4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);

END DCalles_Lab7_SevenSegments;

-- Architecture definition

ARCHITECTURE Behavioral OF DCalles_Lab7_SevenSegments IS

	--------------------------------------------------------------------------
	---------------- COMPONENTS DEFINED IN SEPARATE FILES --------------------
	--------------------------------------------------------------------------

	-- Integer to 7segment decoder
	COMPONENT SevenSegments
		PORT (
			binNumber : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			segmentLed : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;

	-- Integer to 7segment decoder
	COMPONENT Counter16Bits
		PORT (
			clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			count : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	END COMPONENT;

	-- Integer to 7segment decoder
	COMPONENT ModuleDivision
		PORT (
			number : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			divider : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			module : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	END COMPONENT;

	-- Integer to 7segment decoder
	COMPONENT FreqDivider
		PORT (
			clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			factor : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			clk_out : OUT STD_LOGIC);
	END COMPONENT;
	--------------------------------------------------------------------------
	------------------------- INTERMEDIATE SIGNALS ---------------------------
	--------------------------------------------------------------------------

	SIGNAL segment0Signal : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL segment1Signal : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL segment2Signal : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL segment3Signal : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL segment4Signal : STD_LOGIC_VECTOR(6 DOWNTO 0);

	SIGNAL digit0Signal : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL digit1Signal : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL digit2Signal : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL digit3Signal : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL digit4Signal : STD_LOGIC_VECTOR(3 DOWNTO 0);

	SIGNAL countSignal : STD_LOGIC_VECTOR(15 DOWNTO 0);

	SIGNAL dividedclkSignal : STD_LOGIC;
BEGIN

	--------------------------------------------------------------------------
	-------------------------- COMPONENTS MAPPING ----------------------------
	--------------------------------------------------------------------------	

	-- 7 segments
	SevenSegments0 : SevenSegments
	PORT MAP(digit0Signal, segment0Signal);

	-- 7 segments
	SevenSegments1 : SevenSegments
	PORT MAP(digit1Signal, segment1Signal);

	-- 7 segments
	SevenSegments2 : SevenSegments
	PORT MAP(digit2Signal, segment2Signal);

	-- 7 segments
	SevenSegments3 : SevenSegments
	PORT MAP(digit3Signal, segment3Signal);

	-- 7 segments
	SevenSegments4 : SevenSegments
	PORT MAP(digit4Signal, segment4Signal);
	-- 16 bits counter
	Counter16Bits0 : Counter16Bits
	PORT MAP(dividedclkSignal, reset, countSignal);

	-- Clock divider
	FreqDivider0 : FreqDivider
	PORT MAP(clk, reset, clkFactor, dividedclkSignal);

	-- Module Division
	ModuleDivision0 : ModuleDivision
	PORT MAP(countSignal, x"0001", x"000A", digit0Signal);

	-- Module Division
	ModuleDivision1 : ModuleDivision
	PORT MAP(countSignal, x"000A", x"000A", digit1Signal);

	-- Module Division
	ModuleDivision2 : ModuleDivision
	PORT MAP(countSignal, x"0064", x"000A", digit2Signal);

	-- Module Division
	ModuleDivision3 : ModuleDivision
	PORT MAP(countSignal, x"03E8", x"000A", digit3Signal);

	-- Module Division
	ModuleDivision4 : ModuleDivision
	PORT MAP(countSignal, x"2710", x"000A", digit4Signal);

	-- outputs
	segment0 <= segment0Signal;
	segment1 <= segment1Signal;
	segment2 <= segment2Signal;
	segment3 <= segment3Signal;
	segment4 <= segment4Signal;
END;