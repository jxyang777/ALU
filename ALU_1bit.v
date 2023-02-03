module _1bit(a, b, less, Ainvert, Binvert, c_in, op, result, c_out, set, overflow);
	input       a; 
	input       b;
	input       less;
	input       Ainvert;
	input       Binvert;
	input       c_in;
	input [1:0] op;
	
	output result;
	output c_out;
	output set;
	output overflow;
	
	/*
	Write Your Design Here ~
	*/
	reg result;
	
	wire a_in;
	wire b_in;
	wire FA_sum_out;
	wire FA_c_in;

	FA fa(.x(a_in), .y(b_in), .c_in(c_in), .s(FA_sum_out), .c_out(c_out));
	assign a_in = (Ainvert == 0) ? a : ~a;
	assign b_in = (Binvert == 0) ? b : ~b;
	assign overflow = c_in ^ c_out;
	assign set = (a_in < b_in) ? 1 : 0;

			
always@(*) begin
	case(op)
		2'b00: begin
			result = a_in & b_in;
		end

		2'b01: begin
			result = a_in | b_in;
		end

		2'b10: begin
			result = FA_sum_out;
		end

		2'b11: begin
			result = less;
		end
	endcase
end

endmodule

module ALU_1bit(a, b, less, Ainvert, Binvert, c_in, op, result, c_out, set, overflow);
	input       a; 
	input       b;
	input       less;
	input       Ainvert;
	input       Binvert;
	input       c_in;
	input [1:0] op;
	
	output result;
	output c_out;
	output set;
	output overflow;

	wire FA_c_in;
	assign FA_c_in = ({Ainvert, Binvert} == 2'b01) ? 1 : c_in;
	
	_1bit alu_1bit(
		.a(a),
		.b(b),
		.less(less),
		.Ainvert(Ainvert),
		.Binvert(Binvert),
		.c_in(FA_c_in),
		.op(op),
		.result(result),
		.c_out(c_out),
		.set(set),
		.overflow(overflow));

endmodule
