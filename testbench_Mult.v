module tb_mult();


wire signed [255:0] a;
wire signed [255:0] b;
wire signed [255:0] p;
wire signed [255:0] result_tb;
reg clk, start;

assign a = 256'h79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798;
assign p = 256'hfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f;
assign b = 256'hfa690b82061edfd2852629aeba8a8977b57e40fcb77d1a7a28b26cba62591204;

initial begin
clk = 1'b0;
start = #0 1'b0;
start = #100 1'b1;
forever clk = #50 ~clk;
end


GF_Multiplier multiplier_1 (
				.clk(clk),
				.start(start),
				.a(a),
				.b(b),
				.p(p),
				.Result(result_tb)
);

endmodule 