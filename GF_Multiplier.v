module GF_Multiplier (
		input clk, start,
		input signed [255:0] a,
		input signed [255:0] b,
		input signed [255:0] p,
		output signed [255:0] Result
);


wire signed [255:0] mux_sum, reg_T_out;
wire signed [255:0] double_sum;
wire signed [255:0] array_sum;
wire signed [255:0] adder_sum;
wire b_i;
wire [7:0] i;
wire select, select_not;

assign select = (i[0] | i[1] | i[2] | i[3] | i[4] | i[5] | i[6] | i[7]);
assign select_not = ~(i[0] | i[1] | i[2] | i[3] | i[4] | i[5] | i[6] | i[7]);



shift_reg reg_T (
		.clk(clk),
		.start(start),
		.D(mux_sum),
		.Q(reg_T_out)
);


GF_Doubler GF_Doubler_1 (
	.GF_a_dub(reg_T_out),
	.p(p),
	.GF_sum_dub(double_sum)
);

A_Array array_1 (
	.b_i(b_i),
	.a(a),
	.sum(array_sum)
);


GF_Adder GF_Adder_1 (
	.GF_a(double_sum),
	.GF_b(array_sum),
	.p(p),
	.GF_sum(adder_sum)
);

mod256_down_counter counter_1 (
			.clk(clk),
			.start(start),
			.counter_output(i)
);

b_to_b_i btobi (
		.b(b),
		.i(i),
		.b_i(b_i)
);

mux2 mux_multiplier (
		.sum_0(reg_T_out),
		.sum_1(adder_sum),
		.select(select),
		.out_mux(mux_sum)
);

tristate tristate_mult (
			.R(reg_T_out),
			.select_s(select_not),
			.Result(Result)
);

endmodule