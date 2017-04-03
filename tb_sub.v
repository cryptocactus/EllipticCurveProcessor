module tb_GF_Sub();

reg signed [255:0] a, b;
wire signed [255:0] p;
wire signed [256:0] sum_sub;

reg carry_in_n;

initial begin
b <= 256'h7fffffffffffffffffffffffffffffffffffffffffffffffffffffff7ffffe18;
a <= 256'h0;
a <= #50 256'h1;
a <= #100 256'hff1f3;
b <= #150 256'h0;
carry_in_n <= 1'b0;
end

assign p = 256'hfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f;

adder_257 ads(
  .a(p),
  .b(b),
  .carry_in_n(carry_in_n),
  .sum(sum_sub)
);

endmodule