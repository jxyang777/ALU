module FA(x, y, c_in, s, c_out);
	input x, y, c_in;
	output s, c_out;
	
	wire sum1, carry1, carry2;

	HA ha1(.x(x), .y(y), .s(sum1), .c(carry1));
	HA ha2(.x(c_in), .y(sum1), .s(s), .c(carry2));
	or(c_out, carry1, carry2);

endmodule
