-- Counter16Bits.vhd

--***********************************************************************
--	Description: Behavioural description of a 16 bit counter with reset
--				 active-low signal.
--	
--	Inputs: 		
--			clk; clock signal.
--			reset; reset signal (active-low).
--					
--	Outputs:
--			count [15:0]; counter value. 	
--***********************************************************************

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity declaration

ENTITY Counter16Bits IS

	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		count : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);

END Counter16Bits;

-- Architecture definition

ARCHITECTURE Behavioral OF Counter16Bits IS
	--------------------------------------------------------------------------
	------------------------- INTERMEDIATE SIGNALS ---------------------------
	--------------------------------------------------------------------------

	SIGNAL countSignal : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN

	--------------------------------------------------------------------------
	-------------------------- ARCHITECTURE LOGIC ----------------------------
	--------------------------------------------------------------------------	

	PROCESS (clk)
	BEGIN

		IF rising_edge(clk) THEN

			IF (reset = '0') THEN
				countSignal <= x"0000";

			ELSE
				countSignal <= countSignal + x"0001";
			END IF;

		END IF;

	END PROCESS;

	-- outputs
	count <= countSignal;
END;