`timescale 1 ns/1 ns

module ALU_1bit_tb();
	parameter delay = 5;

	reg        a;
	reg        b;
	reg        less;
	reg        Ainvert;
	reg        Binvert;
	reg        c_in;
	reg  [1:0] op;
	
	wire result;
	wire c_out;
	wire set;
	wire overflow;
	
	ALU_1bit UUT(
		.a         (a),
		.b         (b),
		.less      (less),
		.Ainvert   (Ainvert),
		.Binvert   (Binvert),
		.c_in      (c_in),
		.op        (op),
		.result    (result),
		.c_out     (c_out),
		.set       (set),
		.overflow  (overflow)
		);
		
	initial begin
		{a, b, less, c_in, Ainvert, Binvert, op} = 8'b0000000x;
		{a, b, less, c_in, Ainvert, Binvert, op} = 8'b0000001x;
		
		
		
		
		
		
		
		
//		repeat(16) begin
//		#delay {Ainvert, Binvert, op} = 4'b0010;  // Add
//		#delay {Ainvert, Binvert, op} = 4'b0110;  // Sub
//		#delay {Ainvert, Binvert, op} = 4'b0000;  // And
//		#delay {Ainvert, Binvert, op} = 4'b0001;  // Or
//		#delay {Ainvert, Binvert, op} = 4'b1101;  // Nand
//		#delay {Ainvert, Binvert, op} = 4'b1100;  // Nor
//		#delay {Ainvert, Binvert, op} = 4'b0111;  // SLT
//			
//			#delay {a, b} = {a, b} + 1'b1;
//		end
		#delay $stop;
	end
		
endmodule
