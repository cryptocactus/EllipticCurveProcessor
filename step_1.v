module step_1 (
    input signed [255:0] x,
    input signed [255:0] p,
    input signed [255:0] in_reg,
    output signed [255:0] out_reg,
    output signed [255:0] x_out
);

wire signed [255:0] var_shift_out;
wire signed [255:0] t_shift_out;
wire signed [255:0] x_shift_out;
wire signed [255:0] t_mux_out;
wire signed [256:0] t_out;

wire carry_in_;
assign carry_in_ = 1'b0; 



right_shift var_shift (
      .a(in_reg),
      .sum_shift(var_shift_out)
);

right_shift_257 t_shift (
      .a(t_out),
      .sum_shift(t_shift_out)
);

right_shift x_shift (
      .a(x),
      .sum_shift(x_shift_out)
);

mux2 u_mux (
      .sum_0(var_shift_out),
      .sum_1(in_reg),
      .select(in_reg[0]),
      .out_mux(out_reg)
);

mux2 x_mux (
      .sum_0(t_mux_out),
      .sum_1(x),
      .select(in_reg[0]),
      .out_mux(x_out)
);

mux2 t_mux (
      .sum_0(x_shift_out),
      .sum_1(t_shift_out),
      .select(x[0]),
      .out_mux(t_mux_out)
);


adder_257 adder_a (
      .a(p),
      .b(x),
      .sum(t_out),
      .carry_in_n(carry_in_)
);


endmodule