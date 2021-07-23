// FreqDivider.v

/***********************************************************************
--	Description: Frequency divider of a clock signal
--	
--	Inputs: 	
--			clk; clock signal
--			reset; active-low reset signal.
--			factor [9:0}; prescalar for frequency división, 
--							factor[0] -> 2^18, factor[9] -> 2^27
--					
--	Outputs: 
--			clk_out; clock signal with divided frequency
--***********************************************************************/

// Entity declaration

module FreqDivider(

		input clk,
		input reset,
		input [9:0] factor,
		output reg clk_out
);

// Architecture definition


/*------------------------------------------------------------------------
------------------------- INTERMEDIATE SIGNALS ---------------------------
------------------------------------------------------------------------*/

	reg [31:0] countSignal = 32'd0;

	wire [31:0] clkFactorSignal;


/*------------------------------------------------------------------------
-------------------------- COMPONENTS MAPPING ----------------------------
------------------------------------------------------------------------*/	
	
	assign clkFactorSignal = {4'd0, factor, 18'd0};
	
	
	
	always@(posedge clk)
	begin
	
	
		if (!reset) begin
		
			countSignal <= 32'd0;
		end
		
		else begin
		
			if (countSignal < clkFactorSignal) begin 
				countSignal <= countSignal + 32'd1;
			end
			else begin
				countSignal <= 32'd0;
				clk_out <= ~clk_out;
			end
		end
	end

endmodule