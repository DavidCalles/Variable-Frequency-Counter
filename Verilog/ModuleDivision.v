// ModuleDivision.v

/***********************************************************************
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
--**********************************************************************/

module ModuleDivision( 
        input [15:0] number,
		  input [15:0] divider,
		  input [15:0] mod,
        output [3:0] result
		  
    );

/*------------------------------------------------------------------------
------------------------- INTERMEDIATE SIGNALS ---------------------------
------------------------------------------------------------------------*/
	
	reg [15:0]numberSignal = 16'd1;
	reg [15:0]dividerSignal = 16'd1;
	reg [15:0]moduleSignal = 16'd1;
	reg [3:0] resultSignal = 4'b1;

/*------------------------------------------------------------------------
--------------------------- LOGIC DEFINITION -----------------------------
------------------------------------------------------------------------*/	

	always@(number)
	begin
	// Conversions
		numberSignal <= number;
		dividerSignal <= divider;
		moduleSignal <= mod;
	
	// Actual operation	
		resultSignal <= (numberSignal/dividerSignal) % moduleSignal;	

	end
	
	// Conversion to logic vector
	assign result = resultSignal;
	
endmodule