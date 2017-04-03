module GF_Doubler (
		input signed [255:0] GF_a_dub,
		input signed [255:0] p,
		output signed [255:0] GF_sum_dub
);


wire carry_in_n0;
wire signed [255:0] p_not; 
wire signed [255:0] sum_1_shift;
wire signed [255:0] sum_2_adder;
wire signed [255:0] a, b;
wire carry_out_overflow_0, carry_out_overflow_1;
wire overflow_or;


assign carry_in_n0 = 1'b1;
assign p_not = ~p;
assign overflow_or = carry_out_overflow_0 | carry_out_overflow_1;


left_shift left_shift_1 (
			.a(GF_a_dub),
			.sum_shift(sum_1_shift),
			.carry_out_shift(carry_out_overflow_0)
);

adder_256 adder_3 (
		.a(sum_1_shift),
		.b(p_not),
		.carry_in_n(carry_in_n0),
		.sum(sum_2_adder),
		.carry_out_overflow(carry_out_overflow_1)
);

mux2 mux2_GF_dub (
		.sum_0(sum_1_shift),
		.sum_1(sum_2_adder),
		.select(overflow_or),
		.out_mux(GF_sum_dub)
);

endmodule