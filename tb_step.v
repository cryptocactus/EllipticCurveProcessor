
module tb_step();

wire signed [255:0] x1, x2, u, v, p;
wire signed [255:0] x1_out, x2_out, v_out, u_out; 

assign x1 = 256'h79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798;
assign x2 = 256'hBD1DFBB81108F7676E297F5EBB892CC7E5ED68D82C1E00CCC71310DA4E15F581;
assign p = 256'hfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f;
assign u = 256'h483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08ffb10d4b8;
assign v = 256'hAF44419930D4DFCB7D3C53E433675F76D91CFAE51BFF1A777E73F4224267575A;


step_2 step2 (
	.u(u),
	.v(v),
	.x1(x1),
	.x2(x2),
	.p(p),
  	.u_out(u_out),
  	.v_out(v_out),
  	.x1_out(x1_out),
  	.x2_out(x2_out)
);

endmodule