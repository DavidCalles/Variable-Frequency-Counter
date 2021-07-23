/****************************************************
 *	Description: Get outputs for the 7 segments from
 *					 a 4-bit  input (just 1 digit)
 *
 *	Inputs: [3:0] ones, number to be displayed
 *
 *	Outputs: reg[6:0] segments, obtained through
 *				behavioral description. (low means ON)
 ****************************************************/

module SevenSegments(input [3:0] ones,
                     output reg[6:0] segments);

always@(ones)
begin
    case(ones)
        4'b0000 : segments = 7'b1000000; // segment 0
        4'b0001 : segments = 7'b1111001; // segment 1
        4'b0010 : segments = 7'b0100100; // segment 2
        4'b0011 : segments = 7'b0110000; // segment 3
        4'b0100 : segments = 7'b0011001; // segment 4
        4'b0101 : segments = 7'b0010010; // segment 5
        4'b0110 : segments = 7'b0000010; // segment 6
        4'b0111 : segments = 7'b1111000; // segment 7
        4'b1000 : segments = 7'b0000000; // segment 8
        4'b1001 : segments = 7'b0011000; // segment 9
        4'b1010 : segments = 7'b0001000; // segment A
        4'b1011 : segments = 7'b0000011; // segment b
        4'b1100 : segments = 7'b1000110; // segment C
        4'b1101 : segments = 7'b0100001; // segment d
        4'b1110 : segments = 7'b0000110; // segment E
        4'b1111 : segments = 7'b0001110; // segment F
        default : segments = 7'b0111111; // segment -
    endcase
end

endmodule
