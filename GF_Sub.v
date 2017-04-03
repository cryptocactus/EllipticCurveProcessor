

module GF_Sub (
		input signed [255:0] GF_a,
		input signed [255:0] GF_b,
		input signed [255:0] p,
		output signed [255:0] GF_sum
);


wire carry_in_n0; 
wire carry_in_n1;
wire carry_in;

wire signed [255:0] sum_1;
wire signed [255:0] sum_2;
wire carry_out_overflow_0;
wire signed [255:0] b_not;

assign carry_in_n0 = 1'b0;
assign carry_in_n1 = 1'b1;
assign carry_in = 1'b1;
assign b_not = ~GF_b;


adder_256 adder_1 (
		.a(GF_a),
		.b(b_not),
		.carry_in_n(carry_in_n1),
		.sum(sum_1),
		.carry_out_overflow(carry_out_overflow_0)
);

adder_256 adder_2 (
		.a(sum_1),
		.b(p),
		.carry_in_n(carry_in_n0),
		.sum(sum_2),
		.carry_out_overflow()
);

mux2 mux2_GF (
		.sum_0(sum_2),
		.sum_1(sum_1),
		.select(carry_out_overflow_0),
		.out_mux(GF_sum)
);

endmodule

