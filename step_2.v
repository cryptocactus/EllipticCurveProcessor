module step_2 (
	input signed [255:0] u,
	input signed [255:0] v,
	input signed [255:0] x1,
	input signed [255:0] x2,
	input signed [255:0] p,
  	output signed [255:0] u_out,
  	output signed [255:0] v_out,
  	output signed [255:0] x1_out,
  	output signed [255:0] x2_out
);

wire signed [255:0] sub_1_out;
wire signed [255:0] sub_2_out;
wire sub_2_carry_out;
wire signed [255:0] GF_sub_1_out;
wire signed [255:0] GF_sub_2_out;


sub_256 sub_a (
  	.a(u),
  	.b(v),
  	.sum(sub_1_out),
	.carry_out_overflow_not()
);


sub_256 sub_b (
  	.a(v),
  	.b(u),
 	.sum(sub_2_out),
	.carry_out_overflow_not(sub_2_carry_out)
);


mux2 mux_step_2_u (
	.sum_0(u),
	.sum_1(sub_1_out),
	.select(sub_2_carry_out),
	.out_mux(u_out)
);

mux2 mux_step_2_v (
	.sum_0(sub_2_out),
	.sum_1(v),
	.select(sub_2_carry_out),
	.out_mux(v_out)
);



GF_Sub GF_sub_1 (
	.GF_a(x1),
	.GF_b(x2),
	.p(p),
	.GF_sum(GF_sub_1_out)
);


GF_Sub GF_sub_2 (
	.GF_a(x2),
	.GF_b(x1),
	.p(p),
	.GF_sum(GF_sub_2_out)
);

mux2 mux_step_2_c (
	.sum_0(x1),
	.sum_1(GF_sub_1_out),
	.select(sub_2_carry_out),
	.out_mux(x1_out)
);

mux2 mux_step_2_d (
	.sum_0(GF_sub_2_out),
	.sum_1(x2),
	.select(sub_2_carry_out),
	.out_mux(x2_out)
);


endmodule