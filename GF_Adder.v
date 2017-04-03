
module GF_Adder (
		input signed [255:0] GF_a,
		input signed [255:0] GF_b,
		input signed [255:0] p,
		output signed [255:0] GF_sum
);


wire carry_in_n0, carry_in_n1;
wire signed [255:0] p_not; 
wire signed [255:0] sum_1;
wire signed [255:0] sum_2;
wire signed [255:0] a, b;
wire carry_out_overflow_0, carry_out_overflow_1;
wire overflow_or;


assign carry_in_n0 = 1'b0;
assign carry_in_n1 = 1'b1;
assign p_not = ~p;
assign overflow_or = carry_out_overflow_0 | carry_out_overflow_1;


adder_256 adder_1 (
		.a(GF_a),
		.b(GF_b),
		.carry_in_n(carry_in_n0),
		.sum(sum_1),
		.carry_out_overflow(carry_out_overflow_0)
);

adder_256 adder_2 (
		.a(sum_1),
		.b(p_not),
		.carry_in_n(carry_in_n1),
		.sum(sum_2),
		.carry_out_overflow(carry_out_overflow_1)
);

mux2 mux2_GF (
		.sum_0(sum_1),
		.sum_1(sum_2),
		.select(overflow_or),
		.out_mux(GF_sum)
);

endmodule

