// Counter16Bits.v

/************************************************************************
--	Description: 
--	
--	Inputs: 		
--					
--	Outputs: 	
--**********************************************************************/


// Entity declaration

module Counter16Bits(
		input clk,
		input reset,
		output [15:0] count
	);


// Architecture definition
	

/*------------------------------------------------------------------------
------------------------- INTERMEDIATE SIGNALS ---------------------------
------------------------------------------------------------------------*/

	reg [15:0] countSignal;


/*------------------------------------------------------------------------
-------------------------- ARCHITECTURE LOGIC ----------------------------
------------------------------------------------------------------------*/
	
	always@(posedge clk)
	begin
	
		if (!reset) 
			countSignal <= 16'h0000;
			
		else
			countSignal <= countSignal + 16'h0001;	
	
	end
	
	// outputs
	assign count = countSignal;


endmodule