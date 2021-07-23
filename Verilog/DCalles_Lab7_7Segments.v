// DCalles_Lab7_7Segments.vhd

/************************************************************************
--	Description: 
--	
--	Inputs: 		
--					
--	Outputs: 	
--**********************************************************************/

// Entity declaration

module DCalles_Lab7_7Segments(

		input clk,
		input reset,
		input [9:0] clkFactor,
		output [6:0] segment0,
		output [6:0] segment1,	
		output [6:0] segment2,
		output [6:0] segment3,	
		output [6:0] segment4
		
	);



// Architecture definition
	
/*------------------------------------------------------------------------
------------------------- INTERMEDIATE SIGNALS ---------------------------
------------------------------------------------------------------------*/

	wire [6:0] segment0Signal;
	wire [6:0] segment1Signal;
	wire [6:0] segment2Signal;
	wire [6:0] segment3Signal;
	wire [6:0] segment4Signal;
	
	wire [3:0] digit0Signal;
	wire [3:0] digit1Signal;
	wire [3:0] digit2Signal;
	wire [3:0] digit3Signal;
	wire [3:0] digit4Signal;
	
	wire [15:0] countSignal;
	
	wire dividedclkSignal;

/*------------------------------------------------------------------------
-------------------------- COMPONENTS MAPPING ----------------------------
-------------------------------------------------------------------------*/	
	
	// 7 segments
	SevenSegments SevenSegments0(
		digit0Signal, segment0Signal);
	
	// 7 segments
	SevenSegments SevenSegments1(
		digit1Signal, segment1Signal);
	
	// 7 segments
	SevenSegments SevenSegments2(
		digit2Signal, segment2Signal);
	
	// 7 segments
	SevenSegments SevenSegments3(
		digit3Signal, segment3Signal);
	
	// 7 segments
	SevenSegments SevenSegments4(
		digit4Signal, segment4Signal);
	
	
	// 16 bits counter
	Counter16Bits Counter16Bits0(
		dividedclkSignal, reset, countSignal);
	
	// Clock divider
	FreqDivider FreqDivider0(
		clk, reset, clkFactor, dividedclkSignal);
	
	// Module Division
	ModuleDivision ModuleDivision0(
		countSignal, 16'h0001, 16'h000A, digit0Signal);
	
	// Module Division
	ModuleDivision ModuleDivision1(
		countSignal, 16'h000A, 16'h000A, digit1Signal);
	
	// Module Division
	ModuleDivision ModuleDivision2(
		countSignal, 16'h0064, 16'h000A, digit2Signal);
	
	// Module Division
	ModuleDivision ModuleDivision3(
		countSignal, 16'h03E8, 16'h000A, digit3Signal);
	
	// Module Division
	ModuleDivision ModuleDivision4(
		countSignal, 16'h2710, 16'h000A, digit4Signal);
	
	
	// outputs
	assign segment0 = segment0Signal;
	assign segment1 = segment1Signal;
	assign segment2 = segment2Signal;
	assign segment3 = segment3Signal;
	assign segment4 = segment4Signal;


endmodule