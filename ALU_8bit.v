module ALU_8bit(result, zero, overflow, ALU_src1, ALU_src2, Ainvert, Binvert, op);
	input  [7:0] ALU_src1;
	input  [7:0] ALU_src2;
	input        Ainvert;
	input        Binvert;
	input  [1:0] op;
	
	output [7:0] result;
	output       zero;
	output       overflow;
	
	wire c_out0;
	wire c_out1;
	wire c_out2;
	wire c_out3;
	wire c_out4;
	wire c_out5;
	wire c_out6;
	wire c_out7;
	wire ALU7_set;
	
	parameter gnd = 1'b0;
	
	assign zero = ~(((result[0] | result[1]) | (result[2] | result[3])) | ((result[4] | result[5]) | (result[6] | result[7])));
	
	_1bit ALU0(
		.a(ALU_src1[0]),
		.b(ALU_src2[0]),
		.less(ALU7_set),
		.Ainvert(Ainvert),
		.Binvert(Binvert),
		.c_in(Binvert),
		.op(op),
		.result(result[0]),
		.c_out(c_out0),
		.set(),
		.overflow());
		
	_1bit ALU1(
		.a(ALU_src1[1]),
		.b(ALU_src2[1]),
		.less(gnd),
		.Ainvert(Ainvert),
		.Binvert(Binvert),
		.c_in(c_out0),
		.op(op),
		.result(result[1]),
		.c_out(c_out1),
		.set(),
		.overflow());
		
	_1bit ALU2(
		.a(ALU_src1[2]),
		.b(ALU_src2[2]),
		.less(gnd),
		.Ainvert(Ainvert),
		.Binvert(Binvert),
		.c_in(c_out1),
		.op(op),
		.result(result[2]),
		.c_out(c_out2),
		.set(),
		.overflow());
		
	_1bit ALU3(
		.a(ALU_src1[3]),
		.b(ALU_src2[3]),
		.less(gnd),
		.Ainvert(Ainvert),
		.Binvert(Binvert),
		.c_in(c_out2),
		.op(op),
		.result(result[3]),
		.c_out(c_out3),
		.set(),
		.overflow());
	
	_1bit ALU4(
		.a(ALU_src1[4]),
		.b(ALU_src2[4]),
		.less(gnd),
		.Ainvert(Ainvert),
		.Binvert(Binvert),
		.c_in(c_out3),
		.op(op),
		.result(result[4]),
		.c_out(c_out4),
		.set(),
		.overflow());
	
	_1bit ALU5(
		.a(ALU_src1[5]),
		.b(ALU_src2[5]),
		.less(gnd),
		.Ainvert(Ainvert),
		.Binvert(Binvert),
		.c_in(c_out4),
		.op(op),
		.result(result[5]),
		.c_out(c_out5),
		.set(),
		.overflow());
		
	_1bit ALU6(
		.a(ALU_src1[6]),
		.b(ALU_src2[6]),
		.less(gnd),
		.Ainvert(Ainvert),
		.Binvert(Binvert),
		.c_in(c_out5),
		.op(op),
		.result(result[6]),
		.c_out(c_out6),
		.set(),
		.overflow());
		
	_1bit ALU7(
		.a(ALU_src1[7]),
		.b(ALU_src2[7]),
		.less(gnd),
		.Ainvert(Ainvert),
		.Binvert(Binvert),
		.c_in(c_out6),
		.op(op),
		.result(result[7]),
		.c_out(c_out7),
		.set(ALU7_set),
		.overflow(overflow));

endmodule
