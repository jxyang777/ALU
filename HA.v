module HA(x, y, s, c);
	input  x;
	input  y;
	output s;
	output c;
	
	assign {c, s} = x + y;

endmodule
