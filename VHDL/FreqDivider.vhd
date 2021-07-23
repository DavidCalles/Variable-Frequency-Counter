-- FreqDivider.vhd

--***********************************************************************
--	Description: 
--	
--	Inputs: 		
--					
--	Outputs: 	
--***********************************************************************

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity declaration

ENTITY FreqDivider IS

	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		factor : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		clk_out : OUT STD_LOGIC
	);

END FreqDivider;

-- Architecture definition

ARCHITECTURE Behavioral OF FreqDivider IS
	--------------------------------------------------------------------------
	------------------------- INTERMEDIATE SIGNALS ---------------------------
	--------------------------------------------------------------------------

	SIGNAL countSignal : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL clkOutSignal : STD_LOGIC := '0';

	SIGNAL clkFactorSignal : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

	--------------------------------------------------------------------------
	-------------------------- ARCHITECTURE LOGIC ----------------------------
	--------------------------------------------------------------------------
	
	-- Prescalar values are bits 27-18 which represent times visible to the 
	-- human eye
	clkFactorSignal(31 DOWNTO 28) <= (OTHERS => '0');
	clkFactorSignal(27 DOWNTO 18) <= factor;
	clkFactorSignal(17 DOWNTO 0) <= (OTHERS => '0');

	PROCESS (clk)
	BEGIN

		IF rising_edge(clk) THEN

			IF (reset = '0') THEN
				countSignal <= x"00000000";

			ELSE

				IF (countSignal < clkFactorSignal) THEN
					countSignal <= countSignal + x"00000001";
				ELSE
					countSignal <= x"00000000";
					clkOutSignal <= NOT clkOutSignal;

				END IF;

			END IF;

		END IF;

	END PROCESS;

	-- outputs
	clk_out <= clkOutSignal;
END;