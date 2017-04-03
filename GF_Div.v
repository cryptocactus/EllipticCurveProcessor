module GF_Div (
  input signed [255:0] p,
  input signed [255:0] a,
  input signed [255:0] b,
  input mode_select,
  input start,
  input clk,
  output signed [255:0] result_div
);
  
reg signed [255:0] low_in;  
reg signed [255:0] high_in;
wire signed [255:0] mux_j_out;
wire signed [255:0] mux_i_out;
wire signed [255:0] mux_a_out;
wire signed [255:0] mux_b_out;
wire signed [255:0] mux_c_out;
wire signed [255:0] mux_d_out;
wire signed [255:0] mux_e_out;
wire signed [255:0] mux_f_out;
wire signed [255:0] mux_g_out;
wire signed [255:0] mux_h_out;
wire signed [255:0] p_reg_out;
wire signed [255:0] u_reg_out;
wire signed [255:0] v_reg_out;
wire signed [255:0] x1_reg_out;
wire signed [255:0] x2_reg_out;
wire [9:0] counter_out;
wire signed [255:0] step_1_u_out;
wire signed [255:0] step_1_x1_out;
wire signed [255:0] step_1_v_out;
wire signed [255:0] step_1_x2_out;
wire signed [255:0] u_out;
wire signed [255:0] v_out;
wire signed [255:0] x1_out;
wire signed [255:0] x2_out;
wire signed [255:0] array_out;
wire u_and_v;
wire comp_u_out, comp_v_out;
wire nor_out;
wire or_out;
wire counter_or;
wire counter_or_not;

assign counter_or = counter_out[0] | counter_out[1] | counter_out[2] | counter_out[3] | counter_out[4] | counter_out[5] | counter_out[6] | counter_out[7] | counter_out[8] | counter_out[9];
assign counter_or_not = ~counter_or;
assign or_out = comp_u_out | comp_v_out;
assign nor_out = ~or_out;
assign u_and_v = u_reg_out[0] & v_reg_out[0];


initial 
begin
  high_in <= 256'b1;
  low_in <= 256'b0;
end

  
  
mux2 mux_j (
	.sum_0(high_in),
	.sum_1(b),
	.select(mode_select),
	.out_mux(mux_j_out)
);

mux2 mux_a (
	.sum_0(mux_g_out),
	.sum_1(p),
	.select(start),
	.out_mux(mux_a_out)
);

mux2 mux_b (
	.sum_0(mux_h_out),
	.sum_1(low_in),
	.select(start),
	.out_mux(mux_b_out)
);

mux2 mux_c (
	.sum_0(mux_e_out),
	.sum_1(a),
	.select(start),
	.out_mux(mux_c_out)
);

mux2 mux_d (
	.sum_0(mux_f_out),
	.sum_1(mux_j_out),
	.select(start),
	.out_mux(mux_d_out)
);


step_1 step_1_u (
    	.x(x1_reg_out),
    	.p(p_reg_out),
    	.in_reg(u_reg_out),
    	.out_reg(step_1_u_out),
    	.x_out(step_1_x1_out)
);

step_1 step_1_v (
    	.x(x2_reg_out),
   	 .p(p_reg_out),
    	.in_reg(v_reg_out),
    	.out_reg(step_1_v_out),
    	.x_out(step_1_x2_out)
);

step_2 step_2_1 (
	.u(u_reg_out),
	.v(v_reg_out),
	.x1(x1_reg_out),
	.x2(x2_reg_out),
	.p(p_reg_out),
  	.u_out(u_out),
  	.v_out(v_out),
  	.x1_out(x1_out),
  	.x2_out(x2_out)
);



mux2 mux_e (
	.sum_0(step_1_u_out),
	.sum_1(u_out),
	.select(u_and_v),
	.out_mux(mux_e_out)
);


mux2 mux_f (
	.sum_0(step_1_x1_out),
	.sum_1(x1_out),
	.select(u_and_v),
	.out_mux(mux_f_out)
);

mux2 mux_g (
	.sum_0(step_1_v_out),
	.sum_1(v_out),
	.select(u_and_v),
	.out_mux(mux_g_out)
);

mux2 mux_h (
	.sum_0(step_1_x2_out),
	.sum_1(x2_out),
	.select(u_and_v),
	.out_mux(mux_h_out)
);


X_Array compU(
        .u_comp(comp_u_out),
        .x(x1_reg_out),
        .sum(array_out)
);


mux2 mux_i (
	.sum_0(array_out),
	.sum_1(x2_reg_out),
	.select(comp_v_out),
	.out_mux(mux_i_out)

);

tristate tristate_1 (
	.R(mux_i_out),
	.select_s(counter_or_not),//////////////////////////
	.Result(result_div)
);



comparator comparator_u (
    	.a(u_reg_out),
    	.b(high_in),
    	.equal(comp_u_out)
);


comparator comparator_v (
    	.a(v_reg_out),
    	.b(high_in),
    	.equal(comp_v_out)
);


shift_reg_en p_register (
		.clk(clk),
		.D(p),
		.Q(p_reg_out),
		.enable(nor_out)
);

shift_reg_en u_register (
		.clk(clk),
		.D(mux_c_out),
		.Q(u_reg_out),
		.enable(nor_out)
);

shift_reg_en v_register (
		.clk(clk),
		.D(mux_a_out),
		.Q(v_reg_out),
		.enable(nor_out)
);

shift_reg_en x1_register (
		.clk(clk),
		.D(mux_d_out),
		.Q(x1_reg_out),
		.enable(nor_out)
);

shift_reg_en x2_register (
		.clk(clk),
		.D(mux_b_out),
		.Q(x2_reg_out),
		.enable(nor_out)
);

mod512_down_counter counter_down_512 (
    .clk(clk),
    .start(start),
    .counter_output(counter_out)
);



endmodule

